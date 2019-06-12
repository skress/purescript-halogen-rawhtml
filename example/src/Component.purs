module Example.Component where

import Prelude

import Effect.Class                 (class MonadEffect)
import Data.Const                   (Const)
import Data.Maybe                   (Maybe(..))
import Data.Symbol                  (SProxy(..))
import Halogen                      as H
import Halogen.HTML                 as HH
import Halogen.HTML.Properties      as HP

import Halogen.Component.RawHTML    as RawHTML

type ChildSlots = 
  ( r :: H.Slot (Const Void) Void Unit )

type Action = Unit

type State =
  { html :: String
  }

component :: forall m
           . MonadEffect m
          => H.Component HH.HTML (Const Void) Unit Void m
component = 
  H.mkComponent
  { initialState: const { html: "<p> This should be enclosed within a 'p' tag </p>" }
  , render
  , eval: H.mkEval H.defaultEval
  }
  where
  render :: State -> H.ComponentHTML Action ChildSlots m 
  render state = 
    HH.div
      []
      [ HH.h1
        []
        [ HH.text "Testing raw html" ]
      , HH.slot (SProxy :: _ "r") unit RawHTML.component { html: state.html, elRef: "testDiv" } absurd
      ]
