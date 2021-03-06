module View.Definition exposing (view)

import Copy.Keys exposing (Key(..))
import Copy.Text exposing (t)
import Css exposing (..)
import Html.Styled exposing (Html, blockquote, button, dd, div, dl, dt, h1, h2, header, img, li, nav, p, text, ul)
import Html.Styled.Attributes exposing (alt, css, id, src, tabindex)
import Html.Styled.Attributes.Aria exposing (ariaControls, ariaExpanded)
import Html.Styled.Events exposing (onClick)
import Page.Definition exposing (CategoryDefinition, DefinitionCategory(..), Model, Msg(..), categoryIsExpanded, categoryKeysFromListPosition)
import Route exposing (Direction(..), Route(..), renderNavLink)
import Theme exposing (container, containerContent, expanderButtonStyle, expanderClosedStyle, expanderDefinitionStyles, expanderHeadingStyle, expanderItemStyle, expanderOpenStyle, expanderSymbolStyle, generateId, navItemStyles, navListStyle, oneColumn, pageHeadingStyle, quoteStyle, renderWithKeywords, rotate90Style, twoColumn, verticalSpacing, withMediaDesktop, withMediaTablet)


view : Bool -> Model -> Html Msg
view hasConsented model =
    div []
        [ containerContent
            [ header []
                [ h1 [ css [ pageHeadingStyle ], id "focus-target", tabindex -1 ] [ text (t DefinitionTitle) ]
                , div [ css [ introStyle ] ]
                    [ div [ css [ introParagraphStyle ] ]
                        [ p [] (renderWithKeywords (t DefinitionConciseP1))
                        , img [ css [ imageStyle ], src "/Definition.svg" ] []
                        ]
                    , div [ css [ introParagraphStyle ] ]
                        [ div [ css [ popRightStyle ] ] [ p [] (renderWithKeywords (t DefinitionConciseP2)) ]
                        , div [ css [ popLeftStyle ] ] [ p [ css [ marginTop (rem 1) ] ] (renderWithKeywords (t DefinitionConciseP3)) ]
                        , p [ css [ marginTop (rem 2.5) ] ] (renderWithKeywords (t DefinitionConciseP4))
                        ]
                    ]
                ]
            , dl [ css [ categoryListStyle ] ]
                (renderExpandableCategories hasConsented
                    model
                    [ DefinitionCategory1
                    , DefinitionCategory2
                    , DefinitionCategory3
                    , DefinitionCategory4
                    , DefinitionCategory5
                    , DefinitionCategory6
                    ]
                )
            ]
        , container
            [ p [ css [ marginBottom (rem 1), textAlign center ] ] [ text (t SplitterAffirmation) ]
            , nav []
                [ ul [ css [ navListStyle ] ]
                    [ li [ css navItemStyles ]
                        [ renderNavLink None HelpSelfGrid ToHelpSelfFromDefinitionLink
                        ]
                    , li [ css navItemStyles ]
                        [ renderNavLink None GetHelp ToGetHelpFromDefinitionLink
                        ]
                    ]
                ]
            ]
        , verticalSpacing 2
        ]


renderQuotes : List Key -> Html Msg
renderQuotes quoteKeys =
    blockquote [] (List.map (\quoteKey -> p [ css [ quoteStyle ] ] [ text (t quoteKey) ]) quoteKeys)


renderExpandableCategories : Bool -> Model -> List DefinitionCategory -> List (Html Msg)
renderExpandableCategories hasConsented model categories =
    List.map
        (\listPosition ->
            -- We maybe want to ditch this div for valid html - but this is simple
            div []
                [ renderTerm hasConsented model (categoryKeysFromListPosition listPosition)
                , renderDefinition model (categoryKeysFromListPosition listPosition)
                ]
        )
        categories


renderTerm : Bool -> Model -> CategoryDefinition -> Html Msg
renderTerm hasConsented model category =
    if categoryIsExpanded model category.title then
        dt [ css [ expanderItemStyle ] ]
            [ button [ ariaExpanded "true", ariaControls (generateId (t category.title)), onClick (ToggleCategory hasConsented category.title), css [ expanderButtonStyle, expanderOpenStyle ] ]
                [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
                , img [ css [ expanderSymbolStyle, rotate90Style ], src "/Arrow.svg", alt "" ] []
                ]
            ]

    else
        dt [ css [ expanderItemStyle ] ]
            [ button [ ariaExpanded "false", ariaControls (generateId (t category.title)), onClick (ToggleCategory hasConsented category.title), css [ expanderButtonStyle, expanderClosedStyle ] ]
                [ h2 [ css [ expanderHeadingStyle ] ] [ text (t category.title) ]
                , img [ css [ expanderSymbolStyle ], src "/Arrow.svg", alt "" ] []
                ]
            ]


renderDefinition : Model -> CategoryDefinition -> Html Msg
renderDefinition model category =
    if categoryIsExpanded model category.title then
        dd [ css expanderDefinitionStyles, id (generateId (t category.title)) ]
            [ p [] (renderWithKeywords (t category.info))
            , verticalSpacing 2
            , renderQuotes category.quotes
            ]

    else
        text ""



-- Styles


categoryListStyle : Style
categoryListStyle =
    batch
        [ margin2 (rem 2) (rem 1) ]


introStyle : Style
introStyle =
    batch
        [ displayFlex
        , flexWrap wrap
        , alignItems start
        , margin2 zero (rem 1)
        ]


introParagraphStyle : Style
introParagraphStyle =
    batch
        [ flex2 zero oneColumn
        , margin (rem 1)
        , position relative
        , withMediaTablet
            [ flex2 zero twoColumn ]
        , withMediaDesktop
            [ flex2 zero twoColumn ]
        ]


imageStyle : Style
imageStyle =
    batch
        [ margin auto
        , maxWidth (pct 80)
        , paddingTop (rem 1)
        , width (rem 20)
        ]


popRightStyle : Style
popRightStyle =
    batch
        [ backgroundImage (url "/Pop_Right.svg")
        , backgroundRepeat noRepeat
        , backgroundPosition2 (pct 100) zero
        , backgroundSize (px 60)
        , margin4 (px -30) (px -30) zero zero
        , padding4 (px 30) (px 30) zero zero
        ]


popLeftStyle : Style
popLeftStyle =
    batch
        [ backgroundImage (url "/Pop_Left.svg")
        , backgroundRepeat noRepeat
        , backgroundPosition2 zero (pct 100)
        , backgroundSize (px 40)
        , margin4 zero zero (px -30) (px -30)
        , padding4 zero zero (px 30) (px 30)
        ]
