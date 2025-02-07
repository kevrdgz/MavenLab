var textLoadDirectory = loadTextContent('Assets/path/to/nothing')
var binaryLoadDirectory = loadFileAsBase64('Assets/path/to/nothing')

var textLoadFileMissing = loadTextContent('Assets/nothing.file')
var binaryLoadFileMissing = loadFileAsBase64('Assets/nothing.file')

var textLoadFilePathEmpty = loadTextContent('')
var binaryLoadFilePathEmpty = loadFileAsBase64('')

var textLoadInvalidCharactersPath1 = loadTextContent('Assets\\TextFile.txt')
var binaryLoadInvalidCharactersPath1 = loadFileAsBase64('Assets\\binary')

var textLoadInvalidCharactersPath2 = loadTextContent('/Assets/TextFile.txt')
var binaryLoadInvalidCharactersPath2 = loadFileAsBase64('/Assets/binary')

var textLoadInvalidCharactersPath3 = loadTextContent(
  'file://Assets/TextFile.txt'
)
var binaryLoadInvalidCharactersPath3 = loadFileAsBase64('file://Assets/binary')

var textLoadUnsupportedEncoding = loadTextContent(
  'Assets/TextFile.txt',
  'windows-1250'
)

var textLoadWrongEncoding01 = loadTextContent(
  'Assets/encoding-iso.txt',
  'us-ascii'
)
var textLoadWrongEncoding02 = loadTextContent(
  'Assets/encoding-iso.txt',
  'utf-8'
)
var textLoadWrongEncoding03 = loadTextContent(
  'Assets/encoding-iso.txt',
  'utf-16BE'
)
var textLoadWrongEncoding04 = loadTextContent(
  'Assets/encoding-iso.txt',
  'utf-16'
)
var textLoadWrongEncoding05 = loadTextContent(
  'Assets/encoding-ascii.txt',
  'iso-8859-1'
)
var textLoadWrongEncoding06 = loadTextContent(
  'Assets/encoding-ascii.txt',
  'utf-8'
)
var textLoadWrongEncoding07 = loadTextContent(
  'Assets/encoding-ascii.txt',
  'utf-16BE'
)
var textLoadWrongEncoding08 = loadTextContent(
  'Assets/encoding-ascii.txt',
  'utf-16'
)
var textLoadWrongEncoding09 = loadTextContent(
  'Assets/encoding-utf16.txt',
  'iso-8859-1'
)
var textLoadWrongEncoding10 = loadTextContent(
  'Assets/encoding-utf16.txt',
  'utf-8'
)
var textLoadWrongEncoding11 = loadTextContent(
  'Assets/encoding-utf16.txt',
  'utf-16BE'
)
var textLoadWrongEncoding12 = loadTextContent(
  'Assets/encoding-utf16.txt',
  'us-ascii'
)
var textLoadWrongEncoding13 = loadTextContent(
  'Assets/encoding-utf16be.txt',
  'utf-16'
)
var textLoadWrongEncoding14 = loadTextContent(
  'Assets/encoding-utf16be.txt',
  'utf-8'
)
var textLoadWrongEncoding15 = loadTextContent(
  'Assets/encoding-utf16be.txt',
  'us-ascii'
)
var textLoadWrongEncoding16 = loadTextContent(
  'Assets/encoding-utf16be.txt',
  'iso-8859-1'
)
var textLoadWrongEncoding17 = loadTextContent(
  'Assets/encoding-windows1250.txt',
  'utf-16BE'
)
var textLoadWrongEncoding18 = loadTextContent(
  'Assets/encoding-windows1250.txt',
  'utf-16'
)
var textLoadWrongEncoding19 = loadTextContent(
  'Assets/encoding-windows1250.txt',
  'utf-8'
)
var textLoadWrongEncoding20 = loadTextContent(
  'Assets/encoding-windows1250.txt',
  'us-ascii'
)
var textLoadWrongEncoding21 = loadTextContent(
  'Assets/encoding-windows1250.txt',
  'iso-8859-1'
)
var textLoadWrongEncoding22 = loadTextContent(
  'Assets/encoding-utf8.txt',
  'iso-8859-1'
)
var textLoadWrongEncoding23 = loadTextContent(
  'Assets/encoding-utf8.txt',
  'utf-16'
)
var textLoadWrongEncoding24 = loadTextContent(
  'Assets/encoding-utf8.txt',
  'utf-16BE'
)
var textLoadWrongEncoding25 = loadTextContent(
  'Assets/encoding-utf8.txt',
  'us-ascii'
)
var textLoadWrongEncoding26 = loadTextContent(
  'Assets/encoding-utf8-bom.txt',
  'iso-8859-1'
)
var textLoadWrongEncoding27 = loadTextContent(
  'Assets/encoding-utf8-bom.txt',
  'utf-16'
)
var textLoadWrongEncoding28 = loadTextContent(
  'Assets/encoding-utf8-bom.txt',
  'utf-16BE'
)
var textLoadWrongEncoding29 = loadTextContent(
  'Assets/encoding-utf8-bom.txt',
  'us-ascii'
)

var textOversize = loadTextContent('Assets/oversizeText.txt')
var binaryOversize = loadFileAsBase64('Assets/oversizeBinary')

var binaryAsText = loadTextContent('Assets/binary')

var jsonObject1 = loadJsonContent('Assets/jsonInvalid.json.txt')
var jsonObject2 = loadJsonContent('Assets/jsonValid.json.txt', '.')
var jsonObject3 = loadJsonContent('Assets/jsonValid.json.txt', '$.')
var jsonObject4 = loadJsonContent(
  'Assets/jsonValid.json.txt',
  '.propertyThatDoesNotExist'
)
var jsonObject5 = loadJsonContent('Assets/fileNotExists')
