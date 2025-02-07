// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Bicep.Core.Registry.Oci
{
    public static class DescriptorFactory
    {
        public const string AlgorithmIdentifierSha256 = "sha256";
        public const string AlgorithmIdentifierSha512 = "sha512";

        public static OciDescriptor CreateDescriptor(string algorithmIdentifier, StreamDescriptor streamDescriptor)
        {
            var digest = ComputeDigest(algorithmIdentifier, streamDescriptor.Stream);

            return new OciDescriptor(streamDescriptor.MediaType, digest, streamDescriptor.Stream.Length, streamDescriptor.Annotations);
        }

        public static string ComputeDigest(string algorithmIdentifier, Stream stream)
        {
            stream.Seek(0, SeekOrigin.Begin);

            using var algorithm = CreateHashAlgorithm(algorithmIdentifier);
            var hashValue = algorithm.ComputeHash(stream);

            var buffer = new StringBuilder();
            buffer.Append(algorithmIdentifier);
            buffer.Append(':');

            foreach (var @byte in hashValue)
            {
                buffer.Append(@byte.ToString("x2"));
            }

            stream.Seek(0, SeekOrigin.Begin);

            return buffer.ToString();
        }

        private static HashAlgorithm CreateHashAlgorithm(string algorithm) => algorithm switch
        {
            AlgorithmIdentifierSha256 => SHA256.Create(),
            AlgorithmIdentifierSha512 => SHA512.Create(),
            _ => throw new NotImplementedException($"Unknown hash algorithm '{algorithm}'.")
        };
    }
}
