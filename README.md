purescript-halogen-rawhtml
==========================

Dead simple component for rendering Raw HTML in Halogen views.

### Warning

This component injects raw html into your view without any validation of the HTML being injected whatsoever. Use this only if you trust the source of HTML being used. For this reason this package is not published as an official library but is more a demonstration of how you can use raw html within your Halogen component. 

**Note**

This component is written for Halogen 5.
For Halogen 4 see [this snippet](https://gist.github.com/prathje/7422e49b7c809fe8236bb2f213e7076e) for a similar implementation in Halogen 4

### How to use

```
  import Halogen.Component.RawHTML as RawHTML


  render :: State -> H.ComponentHTML Action ChildSlots m
  render state =
    HH.div
      []
      [ HH.h1
        []
        [ HH.text "Testing raw html" ]
      , HH.slot (SProxy :: _ "r") unit RawHTML.component { html: "<p> test </p>", elRef: "testDiv" } absurd
      ]
```

RawHTML Component takes an Input of type

```
type Input = 
  { html :: String
  , elRef :: String
  }
```

where html is a HTML string you want to render and elRef is a unique identifier of the element used to contain the HTML. 


### Example code

Run

```
make example
```

Now navigate to localhost:8080/example/ in your browser. 
The page should display the following HTML

```
<h1> Testing raw html </h1>

<p> This should be enclosed within a 'p' tag </p>
```
