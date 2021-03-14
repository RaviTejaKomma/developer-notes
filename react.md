React:

https://scrimba.com/

 - Componenets
 - JSX
 - Props
 - State
 - Event Handling
 - Lifecycle methods
 - Fetching data from APIs (HTTP)
 - Forms

 Why React?
  - Virtual DOM

- Where we use class in HTML use className in JSX instead. We can apply classNames to react elements not react components.

- Every class based component needs atleast one method render() method.

- The component needs to be a class based component if we want to maintain the state.

- To introduce the state add a constructor() method.

- Anything you need to access of a class inside class. You need to reference it with "this.". Either it is a variable or function. 

- Use setState to modify the content of state.

- Bind the functions.

Life Cycle Methods:

render()

static getDerivedStateFromProps(props, state) {
    // return the new, updated state based upon the props
    // https://reactjs.org/docs/react-component.html#static-getderivedstatefromprops
    // https://reactjs.org/blog/2018/06/07/you-probably-dont-need-derived-state.html
}

getSnapshotBeforeUpdate() {
    // create a backup of the current way things are
    // https://reactjs.org/docs/react-component.html#getsnapshotbeforeupdate
}

componentWillMount() {
        
}


componentDidMount() {
    // GET the data I need to correctly display
}

componentWillReceiveProps(nextProps) {
    if (nextProps.whatever !== this.props.whatever) {
        // do something important here
    }
}

shouldComponentUpdate(nextProps, nextState) {
    // return true if want it to update
    // return false if not
}

componentWillUnmount() {
    // teardown or cleanup your code before your component disappears
    // (E.g. remove event listeners)
}

These 3 got deprecated
componentWillMount
componentWillReceiveProps
componentWillUpdate

https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1

https://reactjs.org/blog/2018/03/29/react-v-16-3.html#component-lifecycle-changes

https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch


/**
 * Other modern/advanced React features/topics to learn:
 * 
 * Official React Context API - https://reactjs.org/docs/context.html
 * Error Boundaries - https://reactjs.org/docs/error-boundaries.html
 * render props - https://reactjs.org/docs/render-props.html
 * Higher Order Components - https://reactjs.org/docs/higher-order-components.html
 * React Router - https://reacttraining.com/react-router/core/guides/philosophy
 * React Hooks - https://reactjs.org/docs/hooks-intro.html
 * React lazy, memo, and Suspense - https://reactjs.org/blog/2018/10/23/react-v-16-6.html
 */