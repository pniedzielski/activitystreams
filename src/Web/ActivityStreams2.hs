{-# LANGUAGE ExistentialQuantification #-}

-------------------------------------------------------------------------------
-- |
-- Module      : Web.ActivityStreams2
-- Description : An Haskell vocabulary for ActivityStreams 2.
-- Copyright   : © 2024, Patrick M. Niedzielski
-- License     : BSD-3-Clause
--
-- Maintainer  : patrick@pniedzielski.net
-- Stability   : stable
-- Portability : alpha
--
module Web.ActivityStreams2
    ( LinkRel(..)
    , LangText(..)
    , Base
    , LinkOrObject(..)
    , Link(..)
    )
  where

import Data.Text (Text)
import Text.URI (URI)

data LinkRel = LinkRel Text | LinkRelURI URI

data LangText = LangText Text Text | NoLangText Text

class Base a where

data LinkOrObject = forall a. Base a => LinkOrObject a

class Link a where
    href :: a -> Maybe URI
    rel :: a -> Maybe [LinkRel]
    mediaType :: a -> Maybe Text
    name :: a -> Maybe [LangText]
    hreflang :: a -> Maybe Text
    height :: a -> Maybe Integer
    width :: a -> Maybe Integer
    preview :: a -> Maybe [LinkOrObject]
