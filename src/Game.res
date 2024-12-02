@react.component
let make = (~gameArea) => {
  <>
    {React.array(
      Array.map([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], i => {
        let iStr = "_" ++ Int.toString(i)
        let mult = 4 * (i / 4)
        switch i == mult || i == 3 + mult {
        | true => <CardOutline key={iStr} cls={`dashed ${iStr}`} />
        | false => <CardOutline key={iStr} cls={`solid ${iStr}`} />
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(gameArea, (stack, i) => {
        let iStr = "_" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) => <Card key={iStr} card cls=iStr />
        | None => React.null
        }
      }),
    )}
    // {React.array(
    //   Array.mapWithIndex(foundations, (stack, i) => {
    //     let iStr = switch i < 4 {
    //     | true => "_" ++ Int.toString(4 * i + 1)
    //     | false => "_" ++ Int.toString(15 - 4 * (i - 4) - 1)
    //     }
    //     switch Null.toOption(Stack.peek(stack)) {
    //     | Some(card) => <Card key={iStr} card cls=iStr />
    //     | None => React.null
    //     }
    //   }),
    // )}
  </>
}
// https://rescript-lang.org/try?version=v11.1.4&module=esmodule&code=LYewJgrgNgpgBAOXPAvHA3gKAC4E8AO8ATjAMZzYA8A5AIYB8caWccYt2tAXHHQDSZWAOxgAPbDwTQoAOipU69eoLgBfTOsyhIsOAGVOpANZMMOAvAUNTLOMAicARruwh8k6XMpIwML4voBVnVYbDtaI1Q4AAoASiZGdFd3KShZIWl1VlC4AEsAZwBRYHw8U2jseJRGbDk3JjRU9OkVHPwIfIALcuw+ADdaKCrElWyYMJEAdx8o9BmZdk4uAag+EXEuWuSs1go6-FMmmWAImGipmdiVLLb6tArhs12c7BgS0y23Uc+DtHzJ3LYUjdH4AWnoR1cAHlSrkQEInrtWAAffQgYBnISPIQydbYUa7VFIEQJRCeDJpAlqUb-QHAihvfDgyEgGHYOEI2xI1F6dGY7ELDi0KlwInw1CMI4UqBUnY7NowGAmNBhaqI1i0oEg-bMzzQ2Hw9WEtEY84CxbCpEoxDi0lSlpWnbXDSYTBuGAIgy0YyYHIAc023j1lFyQmwSlMJ0icUw7S60T9fCOUbOAEZYlc450E0nPCnogAmDOxjrZxPJ07RADMxazOYr0YALMXJp1croAIQFYqlXAJ+K2ADC8PyIFgMigID90UISv7V1Yw6Eo-Hk+nBPwbn7KiumlYQA
