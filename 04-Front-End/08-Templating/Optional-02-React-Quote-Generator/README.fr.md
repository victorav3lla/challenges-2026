## Contexte et objectifs

Encore du React dans ce challenge !

[React](https://reactjs.org/) est une bibliothèque JavaScript permettant de construire des interfaces utilisateur. C'est une bibliothèque très populaire, utilisée par Facebook, Instagram, Netflix, Airbnb, et bien d'autres entreprises. Les apps React sont constituées de composants : un morceau d'interface utilisateur qui a sa propre logique et sa propre apparence.

Dans ce challenge, tu vas construire une app Générateur de citations en utilisant les citations de cette [API](https://github.com/lukePeavey/quotable?tab=readme-ov-file). Vous apprendrez à :

- Importer et utiliser React dans notre projet
- Créer un composant React
- Rendre les composants dans notre application

## Configuration

Nous avons besoin de React, donc nous devons importer le framework React et [React DOM](https://reactjs.org/docs/react-dom.html). Les composants React sont souvent écrits en JSX, mais comme nous n'avons pas de compilateur dans notre projet, nous allons le faire à la manière de Rails et importer [htm](https://github.com/developit/htm), qui nous permet d'écrire une syntaxe similaire à JSX en JavaScript.

Dans l'en-tête de notre projet, nous avons déjà importé ces librairies :

```html
    <script type="application/javascript" src="https://unpkg.com/react@17.0.0/umd/react.production.min.js"></script>
    <script type="application/javascript" src="https://unpkg.com/react-dom@17.0.0/umd/react-dom.production.min.js"></script>
    <script type="application/javascript" src="https://unpkg.com/babel-standalone@6.26.0/babel.js"></script>
```

## Notre premier composant

Notre fichier `lib/index.jsx` est déjà prêt afin de générer un composant `App` :

```js
const App = () => {
  const message = "If you see this message in your browser, that means React is successfully mounted! 🙌";

  return (
    <div id="quoteGeneratorContainer">
      {message}
    </div>
  );
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

Maintenant, lançons notre serveur, tu devrais voir un message indiquant que React a été installé avec succès ! 🥳
## Générateur de citations

Maintenant que notre application fonctionne et que notre premier petit composant a été créé, construisons le reste de notre application !

### Quote component

Créons un composant `Quote.js` dans le fichier `lib/index.jsx` (tu devrais le placer au-dessus du composant `App`). Ce composant sera une carte de citation, avec la citation et l'auteur. Pour créer la carte, nous utiliserons un élément `div`, un élément `p` pour la citation et un élément `span` pour l'auteur.

```js
const Quote = () => {
  return (
    <div>
      <p>
        <span>“</span>
        Genius is one percent inspiration and ninety-nine percent perspiration.
        <span>“</span>
      </p>
      <span>- Thomas Edison</span>
    </div>
  );
}
```

### App component

A présent, modifions le composant `App` pour effectuer le rendu du composant `Quote`.

```js
const App = () => {
  return (
    <div id="quoteGeneratorContainer">
      <Quote />
    </div>
  );
}
```

Relance la page, vous devriez voir notre citation apparaître ! 🥳

Améliorons le composant `App` pour qu'il retourne les citations et qu'il y ait un bouton pour obtenir un nouveau devis. Nous allons utiliser un élément `div` pour le conteneur, et un élément `button` pour le bouton.

```js
const App = () => {
  return (
    <div id="quoteGeneratorContainer">
      <div className="container">
        <Quote />
        <button className="btn btn-primary mt-3">More inspiration</button>
      </div>
    </div>
  );
}
```

Ajoutons un peu de style (dans `style.css`) à notre conteneur et à l'élément racine pour que nos citations s'affichent joliment :

```css
#root {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #e6cba1;
  background-repeat: no-repeat;
  background-size: 100vw 100vh;
}

.container {
  width: 550px;
  border-radius: 20px;
  background-color: rgba(255, 255, 255, 0.85);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 30px 40px;
  font-size: 1.3rem;
}
```

Relance la page. Notre application commence à ressembler à quelque chose 💪

Une citation, c'est bien, mais ce serait encore mieux si nous pouvions obtenir une sélection de citations, à partir de l'API ! Nous allons utiliser la fonction `fetch` pour le faire. Nous allons créer un hook `useEffect` pour récupérer les citations lorsque le composant est monté. Nous stockerons les citations dans un état `quotes`, et nous utiliserons le hook `useState` pour le faire.

**Ressources:**
- [`React.useState`](https://beta.reactjs.org/reference/react/useState) permet d'ajouter une variable d'état à votre composant. Ici, nous pouvons stocker le tableau de citations, avec un tableau vide `[]` par défaut.
- [`React.useEffect`](https://beta.reactjs.org/reference/react/useEffect) nous permet de sortir de React, pour utiliser un système externe, ici une API, dans notre composant.

```js
// [...]
const App = () => {
  const [quotes, setQuotes] = React.useState([]);
  console.log("Quotes: ", quotes);

  React.useEffect(() => {
    fetch('https://quotable.vercel.app/quotes')
      .then((response) => response.json())
      .then((data) => setQuotes(data.results));
  }, []);

  return (
    <div id="quoteGeneratorContainer">
      <div className="container">
        <Quote />
        <button className="btn btn-primary mt-3">More inspiration</button>
      </div>
    </div>
  );
}
```

Vérifie la console, tu devrais voir les citations chargées dans `Quotes` ! Elles sont maintenant sauvegardées dans le `state` de notre composant `Container`.

Créons une fonction pour obtenir une citation aléatoire dans l'array. Nous avons déjà vu comment obtenir un nombre aléatoire en JavaScript dans le cours HTTP & API. Nous utiliserons la fonction `Math.random` pour obtenir un nombre aléatoire entre 0 et 1, et nous le multiplierons par la longueur du tableau pour obtenir un index aléatoire.

```js
// [...]

const App = () => {
  // [...]
  const getRandomQuote = (quotes) => {
    const randomIndex = Math.floor(Math.random() * quotes.length);
    return quotes[randomIndex];
  };

  // [...]
}
```

Nous avons également besoin d'ajouter un `state` supplémentaire à notre application pour pouvoir définir une citation et savoir laquelle nous sommes en train d'afficher. Nous pouvons l'ajouter avec :

```js
const [quotes, setQuotes] = React.useState([]);
const [currentQuote, setCurrentQuote] = React.useState(null); // Add this line
```

Nous avons maintenant un état `currentQuote`, qui sera `null` par défaut puisque les citations ne seront pas encore chargées.

Créons une autre fonction `getNewQuote()` qui obtiendra une citation aléatoire et la définira comme la citation actuelle (celle qu'on voit sur la page).

```js
const getNewQuote = (quotes) => {
  const newQuote = getRandomQuote(quotes);
  setCurrentQuote(newQuote);
};
```

Utilisons-le à partir de `React.useEffect`, une fois que nous aurons toutes les citations disponibles, pour avoir une citation aléatoire lorsque nous chargeons la page :

```js
console.log("currentQuote: ", currentQuote);
React.useEffect(() => {
    fetch('https://quotable.vercel.app/quotes')
      .then((response) => response.json())
      .then((data) => {
        setQuotes(data.results);
        getNewQuote(data.results);
      });
  }, []);
```

Nous avons maintenant une citation aléatoire lorsque nous chargeons la page ! 🎉 Mais elle n'apparaît pas encore sur la page, uniquement dans la console.

Au lieu de notre citation codée en dur dans le composant `Quote`, utilisons la citation stockée dans l'état `currentQuote`.

```js
const Quote = ({ quote }) => {
  return (
    <div className="quote">
      <p className="quote-text">
        <span>"</span>
        {quote.content}
        <span>"</span>
      <p/>
      <span className="quote-author">- ${quote.author}</span>
    </div>
  );
}
```

On peut maintenant passer la citation au composant en tant que `prop`. En ReactJS, les `props` sont un type d'objet où la valeur des attributs d'une balise est stockée. Dans notre cas, nous allons passer le `currentQuote` comme `prop` au composant `Quote`.

```js
// components/App.js
// [...]

const App = () => {
  // [...]
  return (
    <div className="container">
      <Quote quote={currentQuote} />
      <button className="btn btn-primary mt-3">More inspiration</button>
    </div>
  );
}
```

Relance la page. Nous obtenons toujours une erreur, car `currentQuote` est `null` au début, et que nous essayons d'accéder aux propriétés `text` et `author` de `null`.

Nous pouvons corriger cela en ajoutant une condition au composant `Quote`, pour afficher un message de chargement si la citation est `null` :

```js
const Quote = ({ quote }) => {
  if (quote === null) {
    return <p>Loading...</p>;
  }

  return (
    <div className="quote">
      <p className="quote-text">
        <span>"</span>
        {quote.content}
        <span>"</span>
      </p>
      <span className="quote-author">- ${quote.author}</span>
    </div>
  );
}
```

A présent, recharge la page de nouveau, et tu devrais voir une citation aléatoire !

### Ajout d'un bouton pour obtenir une nouvelle citation aléatoire

Comme nous avons déjà ajouté un bouton dans notre composant App, ajoutons une fonction qui, lorsque nous cliquons dessus, nous permettra d'obtenir une nouvelle citation.

Pour cela, nous pouvons lier notre fonction `getNewQuote` existante à l'événement `onClick` du bouton :

```js
const App = () => {
  // [...]
  return (
    <div className="container">
      <Quote quote={currentQuote} />
      <button className="btn btn-primary mt-3" onClick={() => getNewQuote(quotes)}>More inspiration</button>
    </div>
  );
}
```

Maintenant, clique sur le bouton pour voir une nouvelle citation aléatoire à chaque fois ! 🚀

## Ajouter du style

Libre à toi de jouer avec le style de l'application pour la rendre encore plus belle ou d'ajouter un titre ! 💅

## Pour aller plus loin

- [React documentation](https://reactjs.org/docs/getting-started.html)
- [Official Learn React track](https://beta.reactjs.org/learn) si tu as aimé ce challenge et souhaite aller plus loin après le bootcamp !
