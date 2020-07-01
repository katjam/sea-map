module Page.Definition exposing (Model, Msg(..), update, view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, a, button, dd, div, dl, dt, h1, h2, header, li, p, span, text, ul)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onClick)
import Set
import Theme exposing (colours, pageHeadingStyle)


type alias Model =
    { openCategories : Set.Set String }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { openCategories = Set.empty }
    , Cmd.none
    )


type Msg
    = NoOp
    | ToggleCategory Key


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleCategory categoryTitle ->
            let
                action =
                    if isExpanded model categoryTitle then
                        Set.remove

                    else
                        Set.insert
            in
            ( { model | openCategories = action (t categoryTitle) model.openCategories }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [ css [ pageHeadingStyle ] ] [ text (t DefinitionTitle) ]
            , p [ css [ introStyle ] ]
                [ text (t DefinitionConcise)
                , text " "
                , a [ href (t StatsOnEconomicAbuseHref) ] [ text (t DefinitionMoreLink) ]
                ]
            ]
        , dl [ css [ categoryListStyle ] ]
            (renderExpandableCategories
                model
                [ DefinitionCategory1
                , DefinitionCategory2
                , DefinitionCategory3
                , DefinitionCategory4
                , DefinitionCategory5
                ]
            )
        , p [] [ text (t SplitterAffirmation) ]
        , ul []
            [ li [] [ a [ href (t HelpSelfGridPageSlug) ] [ text (t ToHelpSelfFromDefinitionLink) ] ]
            , li [] [ a [ href (t GetHelpPageSlug) ] [ text (t ToGetHelpFromDefinitionLink) ] ]
            ]
        ]


renderQuotes : List Key -> Html Msg
renderQuotes quoteKeys =
    div [] (List.map (\quoteKey -> p [] [ text (t quoteKey) ]) quoteKeys)


renderExpandableCategories : Model -> List DefinitionCategory -> List (Html Msg)
renderExpandableCategories model categories =
    List.map
        (\listPosition ->
            -- We maybe want to ditch this div for valid html - but this is simple
            div []
                [ renderTerm (categoryKeysFromListPosition listPosition)
                , renderDefinition model (categoryKeysFromListPosition listPosition)
                ]
        )
        categories


renderTerm : CategoryDefinition -> Html Msg
renderTerm category =
    dt []
        [ button [ onClick (ToggleCategory category.title), css [ expanderButtonStyle ] ]
            [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
            , span [] [ text "+" ]
            ]
        ]


renderDefinition : Model -> CategoryDefinition -> Html Msg
renderDefinition model category =
    if isExpanded model category.title then
        dd []
            [ p [] [ text (t category.info) ]
            , renderQuotes category.quotes
            ]

    else
        text ""


isExpanded : Model -> Key -> Bool
isExpanded model titleKey =
    if Set.member (t titleKey) model.openCategories then
        True

    else
        False


type alias CategoryDefinition =
    { title : Key
    , info : Key
    , quotes : List Key
    }



-- There are 5 list positions available


type DefinitionCategory
    = DefinitionCategory1
    | DefinitionCategory2
    | DefinitionCategory3
    | DefinitionCategory4
    | DefinitionCategory5


categoryKeysFromListPosition : DefinitionCategory -> CategoryDefinition
categoryKeysFromListPosition listPosition =
    case listPosition of
        DefinitionCategory1 ->
            { title = DefinitionCategory1Title
            , info = DefinitionCategory1Info
            , quotes =
                [ DefinitionCategory1Quote1
                , DefinitionCategory1Quote2
                , DefinitionCategory1Quote3
                ]
            }

        DefinitionCategory2 ->
            { title = DefinitionCategory2Title
            , info = DefinitionCategory2Info
            , quotes =
                [ DefinitionCategory2Quote1
                , DefinitionCategory2Quote2
                , DefinitionCategory2Quote3
                ]
            }

        DefinitionCategory3 ->
            { title = DefinitionCategory3Title
            , info = DefinitionCategory3Info
            , quotes =
                [ DefinitionCategory3Quote1
                , DefinitionCategory3Quote2
                , DefinitionCategory3Quote3
                ]
            }

        DefinitionCategory4 ->
            { title = DefinitionCategory4Title
            , info = DefinitionCategory4Info
            , quotes =
                [ DefinitionCategory4Quote1
                , DefinitionCategory4Quote2
                , DefinitionCategory4Quote3
                ]
            }

        DefinitionCategory5 ->
            { title = DefinitionCategory5Title
            , info = DefinitionCategory5Info
            , quotes =
                [ DefinitionCategory5Quote1
                , DefinitionCategory5Quote2
                , DefinitionCategory5Quote3
                ]
            }


categoryListStyle : Style
categoryListStyle =
    Css.batch
        [ margin2 (rem 2) zero ]


introStyle : Style
introStyle =
    Css.batch
        [ color colours.purple
        , fontFamilies [ "Raleway", sansSerif.value ]
        , fontSize (rem 1.25)
        , margin2 (rem 2) zero
        ]


expanderButtonStyle : Style
expanderButtonStyle =
    batch
        [ backgroundColor (hex "4f2f8d")
        , border zero
        , textAlign left
        , displayFlex
        , padding (rem 0.5)
        , width (pct 100)
        ]


expanderHeadingStyle : Style
expanderHeadingStyle =
    batch
        [ color colours.white
        ]
