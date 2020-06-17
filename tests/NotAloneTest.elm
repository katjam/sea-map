module NotAloneTest exposing (suite)

import Expect exposing (Expectation)
import Html
import Html.Attributes
import Html.Styled
import Page.NotAlone exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, tag, text)


suite : Test
suite =
    describe "Not Alone View"
        [ test "Not Alone view has title" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.contains [ Html.text "[cCc] You Are Not Alone" ]
        , test "Not Alone view has 1 nav link" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "a" ]
                    |> Query.count (Expect.equal 1)
        , test "Not Alone view has nav link to definition" <|
            \() ->
                view {}
                    |> Html.Styled.toUnstyled
                    |> Query.fromHtml
                    |> Query.find [ tag "a", attribute (Html.Attributes.href "definition") ]
                    |> Query.has [ text "Find out more about Economic Abuse" ]
        ]
