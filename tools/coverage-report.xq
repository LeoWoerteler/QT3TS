xquery version "3.0";
    declare namespace fots = "http://www.w3.org/2010/09/qt-fots-catalog";
        
   <changes>{     
        let $changes := doc('../changes.xml')//change/@id/string()
        let $testfiles := doc('../catalog.xml')//fots:test-set/@file/doc(resolve-uri(., base-uri(..)))
        let $testsets := $testfiles/fots:test-set
        for $token in distinct-values($changes)
        let $relevant-testsets := $testsets[tokenize(@covers, ' ') = $token]
        let $relevant-testcases := $testsets/fots:test-case[tokenize(@covers, ' ') = $token]
        let $count := count($relevant-testsets/fots:test-case) + count($relevant-testcases)
        let $desc := doc('../changes.xml')//change[@id=$token]
        return <change change="{$token}" description="{$desc}" tests="{$count}"/>
  }</changes>      