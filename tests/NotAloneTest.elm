module NotAloneTest exposing (suite)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Expect exposing (Expectation)
import Html
import Html.Attributes
import Page.NotAlone exposing (Msg(..))
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)
import TestUtils exposing (queryFromStyledHtml)
import View.NotAlone exposing (view)


suite : Test
suite =
    let
        initModel =
            { revealedJourney = Nothing }
    in
    describe "NotAlone View"
        [ test "NotAlone view has title" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.contains [ Html.text (t NotAloneTitle) ]
        , test "NotAlone view has 5 nav links (1 navigation, 3 emergency)" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 4)
        , test "NotAlone view has nav links to definition" <|
            \() ->
                queryFromStyledHtml (view initModel)
                    |> Query.findAll [ tag "a", attribute (Html.Attributes.href (t DefinitionPageSlug)) ]
                    |> Query.each (Query.has [ text (t ToDefinitionFromNotAloneLink) ])

        -- todo "I can toggle journey content from hidden to revealed"
        -- todo "If a card is open, there is a nav link that isn't display: none"
        -- todo "I can toggle journey content from revealed to hidden"
        -- todo "More coverage?"
        ]
