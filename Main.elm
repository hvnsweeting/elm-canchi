import Html exposing (Html, Attribute, beginnerProgram, text, div, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String
import List
import Markdown

main =
  beginnerProgram { model = "", view = view, update = update }

-- Update

type Msg = NewContent String

update (NewContent content) oldContent =
  content


chis = ["Thân", "Dậu", "Tuất", "Hợi", "Tí", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi"]
cans = ["Canh", "Tân", "Nhâm", "Quý", "Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ"]

get n xs = List.head (List.drop n xs)

sure m =
  case m of
    Just s -> s
    Nothing -> ""

calculateCanChi year =
  sure (get (Result.withDefault 0 (String.toInt year) % 10) cans)
  ++ " "
  ++ sure (get (Result.withDefault 0 (String.toInt year) % 12) chis)

-- VIEW
view content =
  div []
    [ input [ placeholder "Năm cần tính can chi", onInput NewContent, myStyle ] []
    , div [ myStyle ] [ text ( calculateCanChi content ) ]
    , div [ myStyle ] [ Markdown.toHtml [] "A product of [PyMi.vn](https://pymi.vn) built using Elm - <a href='https://github.com/hvnsweeting/elm-canchi' target='_blank'>Code</a>" ]
    ]

myStyle =
  style
    [ ("width", "100%")
    , ("height", "40px")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "center")
    ]
