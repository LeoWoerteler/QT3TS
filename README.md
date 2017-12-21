# XQuery/XPath/XSLT 3.* Test Suite

The XQuery/XPath 3.* Test Suite (QT3TS) provides a set of tests designed to demonstrate the interoperability of [W3C XML Query Language, version 3.0](http://www.w3.org/TR/xquery-30/) and [W3C XML Path Language](http://www.w3.org/TR/xpath-30/) implementations.

The test suite currently contains over 26,000 test cases.

The tests are published as a set of files, mostly in XML format. W3C does not supply a test driver for executing the tests; you will have to write your own. Some implementors, however, have made their test drivers available as part of the download, and you are welcome to use these as a baseline for developing your own drivers.

The metadata for each test indicates its dependencies. These include the specification(s) exercised by the test (some subset of XPath 2.0, XPath 3.0, XQuery 1.0, and XQuery 3.0), as well as dependencies on optional features which implementations may or may not support (such as formatting of dates using English-language month names). The idea is that if your implementation does not support an optional feature, you should not run the tests that require that feature.

## History

Very many of the QT3 tests were converted automatically from tests in the older [XML Query 1.0 test suite](http://dev.w3.org/cvsweb/2006/xquery-test-suite/). There are several changes in approach:

1. in most cases the test query is now inline within the catalog, making it much easier to find all the tests for a given area and to add new tests
2. the mechanisms for testing results are more flexible: instead of being confined to comparing serialized output of a query, it is now possible to make an arbitrary number of assertions about the result. This gives much greater flexibility in handling queries where aspects of the result are implementation defined (for example, the order of items in the result)
3. the dependencies applying to each test are more clearly defined in the metadata. Each test refers to a named environment which in turn defines resources such as source documents and schemas used by the test: this allows resources used by multiple tests to be shared, without making all resources global. In addition, each test states its assumptions about the specification language and features that it depends on: for example a test might be labelled as XP20+ to indicate that it requires XPath 2.0 or later, or as XQ10 to indicate that it is only expected to be run with XQuery 1.0 and not with any later version. Test drivers can either use this information to configure an XPath/XQuery processor that meets the expectations, or they can use it to decide which tests it is approprriate to run. When reported test results are tabulated, they will be tabulated separately for each optional feature, so a processor that implements only XQuery 3.0 and not XQuery 1.0 will not be listed in the tabulation for XQuery 1.0.

To enable tracking of test history, including controversies that may have arisen in the past about the correctness of test results, all test names of XQuery 1.0 tests have been retained unchanged.

## Current Status

Currently the test suite is work in progress. There are no versioned releases, instead the tests are continuously updated in the CVS repository. This will change as the specifications themselves stabilize, at which point snapshots of this test suite will be frozen and given version numbers.

Users of the test suite are strongly encouraged to provide feedback via the Bugzilla bug database. A goal of the test suite is to discover areas where the language specification is unclear, and where implementations can therefore produce results that are different from those published; where this occurs, the Working Group will examine the issue, and decide whether to make the specification more prescriptive, or to change the test case to allow alternative results.

At the time of writing (January 2013), QT3TS contains over 25,000 test cases, and these are believed to cover most areas of the specification; the area where coverage is weakest is serialization. Working Group members and others are continually adding new tests.

Change control is currently informal. Anyone with CVS write access is able to submit new tests without formality, and these become part of the test suite unless challenged by means of a bug report. Existing tests should not be changed until there has been discussion of the change among interested parties (typically including the test author), but individuals are responsible for deciding whether changes are sufficiently controversial to merit discussion by the full Working Group. However, any user of the tests has the right to challenge new or changed tests and ask the relevant Working Group(s) to make a formal decision.

## Organization of the Test Suite

The test suite contains a catalog that contains general information on the test suite as well as test descriptions for each of the test cases included in this release. Test queries and assertions about the expected results are contained in the catalog, or in some cases in files referenced from the catalog.

The tests are organised into a number of groups, each with its own naming conventions.

 * fn: tests of functions in Functions and Operators, one per function, named according to the function
 * op: tests of operators in Functions and Operators, one per operator, named according to the operator
 * math: tests of the functions in the math namespace
 * map: tests of the facilities in the XSL WG maps proposal (which is not currently part of XPath or XQuery)
 * prod: tests of XPath and XQuery language features, named after a production in the XPath/XQuery grammar that is most relevant to the test in question (for example CastExpr or CompAttrConstructor)
 * xs: tests of specific data types
 * misc: tests for capabilities that are orthogonal to specific language features, for example error handling, support for different XML editions, or support for non-BMP unicode characters.
 * app: tests of XPath/XQuery "applications", that is, queries designed to accomplish some applicatation-oriented goal, rather than merely to test individual language constructs. These include tests harvested from the published use cases, from the XMark benchmark suite, and from Priscilla Walmsley's functx library, and also a number of tests whose main purpose is to validate the integrity of the test catalog itself.

There is a master catalog, catalog.xml, that contains references to subsidiary catalogs, one per test area, organized in directories as above. There are some additional directories:

 * docs: contains source documents and schemas used globally throughout the test suite
 * tools: contains a miscellany of tools used for preparing or analyzing tests
 * drivers: contains a selection of contributed test drivers that may be used as a starting point for writing new test drivers

## Using the Test Suite

Implementors are encouraged 1) to write a harness for this test suite and to test their implementations and 2) to report their results to the XML Query Working Group. All of these areas are discussed in greater detail in the documents referenced below.

See the following documents:

1. [Writing and submitting tests](https://dev.w3.org/2011/QT3-test-suite/guide/submitting.html)

2. [Running tests](https://dev.w3.org/2011/QT3-test-suite/guide/running.html)

3. [Reporting results](https://dev.w3.org/2011/QT3-test-suite/guide/reporting.html)

## Releases

| Version | Date           | File        |
| ------- | -------------- | ----------- |
| 1.0     | 21st June 2013 | [QT3_1_0.zip](https://dev.w3.org/2011/QT3-test-suite/releases/QT3_1_0.zip) |

## Documentation

The primary documentation of the test suite (alongside this document) is the schema for the catalog and test-set files, which is found at [catalog-schema.xsd](https://dev.w3.org/2011/QT3-test-suite/catalog-schema.xsd). If viewed directly in an XSLT-capable browser, the schema is rendered automatically into HTML. In case this mechanism does not work, a pre-rendered version of the HTML is at [catalog-schema.html](https://dev.w3.org/2011/QT3-test-suite/catalog-schema.html). (In many browsers the pre-rendered form is more readable).

----------------------------------------

[Webmaster](http://www.w3.org/Help/Webmaster) · *Last modified: $Date: 2014-11-20 16:16:58 $ by $Author: mkay $*

[Copyright](http://www.w3.org/Consortium/Legal/ipr-notice#Copyright) © 1994-2013 [W3C](http://www.w3.org/)® ([MIT](http://www.csail.mit.edu/), [ERCIM](http://www.ercim.org/), [Keio](http://www.keio.ac.jp/)), All Rights Reserved. W3C [liability](http://www.w3.org/Consortium/Legal/ipr-notice#Legal_Disclaimer), [trademark](http://www.w3.org/Consortium/Legal/ipr-notice#W3C_Trademarks), [document use](http://www.w3.org/Consortium/Legal/copyright-documents) and [software licensing](http://www.w3.org/Consortium/Legal/copyright-software) rules apply. Your interactions with this site are in accordance with our [public](http://www.w3.org/Consortium/Legal/privacy-statement#Public) and [Member](http://www.w3.org/Consortium/Legal/privacy-statement#Members) privacy statements.
