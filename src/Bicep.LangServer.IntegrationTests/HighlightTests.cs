// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading.Tasks;
using Bicep.Core.Navigation;
using Bicep.Core.Parsing;
using Bicep.Core.Samples;
using Bicep.Core.Semantics;
using Bicep.Core.Syntax;
using Bicep.Core.Syntax.Visitors;
using Bicep.Core.UnitTests;
using Bicep.Core.UnitTests.Assertions;
using Bicep.Core.UnitTests.Utils;
using Bicep.LangServer.IntegrationTests.Assertions;
using Bicep.LangServer.IntegrationTests.Extensions;
using Bicep.LangServer.IntegrationTests.Helpers;
using Bicep.LanguageServer.Utils;
using FluentAssertions;
using FluentAssertions.Execution;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OmniSharp.Extensions.LanguageServer.Protocol;
using OmniSharp.Extensions.LanguageServer.Protocol.Document;
using OmniSharp.Extensions.LanguageServer.Protocol.Models;
using SymbolKind = Bicep.Core.Semantics.SymbolKind;

namespace Bicep.LangServer.IntegrationTests;

[TestClass]
public class HighlightTests : TestBase
{
    private static readonly SharedLanguageHelperManager DefaultServer = new();

    [ClassInitialize]
    public static void ClassInitialize(TestContext testContext)
    {
        DefaultServer.Initialize(async () => await MultiFileLanguageServerHelper.StartLanguageServer(testContext));
    }

    [ClassCleanup]
    public static async Task ClassCleanup()
    {
        await DefaultServer.DisposeAsync();
    }

    [TestMethod]
    [DataRow("""
var te|st = 'asdf'

var asdf = test
var blah = '${test}'
""", """
1| var test = 'asdf'
       ~~~~ Write
2| 
3| var asdf = test
              ~~~~ Read
4| var blah = '${test}'
                 ~~~~ Read

""")]
    public async Task HighlightsShouldShowAllReferencesOfTheSymbol(string inputWithCursor, string outputAnnotated)
    {
        var (contents, cursor) = ParserHelper.GetFileWithSingleCursor(inputWithCursor);
        var file = await new ServerRequestHelper(TestContext, DefaultServer).OpenFile(contents);

        var highlights = await file.RequestDocumentHighlight(cursor);

        AnnotateWithHighlights(file, highlights).Should().EqualIgnoringTrailingWhitespace(outputAnnotated);
    }

    [TestMethod]
    [DataRow("""
var test = 'asdf'
|
var asdf = test
var blah = '${test}'
""")]
    public async Task RequestingHighlightsForWrongNodeShouldProduceNoHighlights(string inputWithCursor)
    {
        var (contents, cursor) = ParserHelper.GetFileWithSingleCursor(inputWithCursor);
        var file = await new ServerRequestHelper(TestContext, DefaultServer).OpenFile(contents);

        var highlights = await file.RequestDocumentHighlight(cursor);

        highlights.Should().BeNullOrEmpty();
    }

    private static string AnnotateWithHighlights(FileRequestHelper file, DocumentHighlightContainer? highlights)
        => PrintHelper.PrintWithAnnotations(
            file.Source,
            highlights!.Select(x => new PrintHelper.Annotation(Assertions.AssertionScopeExtensions.FromRange(file.Source, x.Range), x.Kind.ToString())), 1, true);
}
