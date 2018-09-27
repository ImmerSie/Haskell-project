{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Mirror where

import Import
import qualified Data.Text as T

getMirrorR :: Handler RepHtml
getMirrorR = do
    defaultLayout $ do
        $(whamletFile "./templates/mirror.hamlet")

postMirrorR :: Handler RepHtml
postMirrorR = do
    postedText <- runInputPost $ ireq textField "content"
    defaultLayout $ do
        $(whamletFile "./templates/posted.hamlet")