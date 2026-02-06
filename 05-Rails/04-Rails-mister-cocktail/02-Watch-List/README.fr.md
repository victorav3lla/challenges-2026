## Contexte et objectifs

On va maintenant créer une application à 3 modèles ! Et tu l'auras deviné, on va introduire une relation `N:N`. Qu'est-ce qu'on va créer ? Une application avec des listes dans lesquelles tu pourras enregistrer tes films préférés.

Voici les **actions utilisateur** que nous voulons implémenter dans notre application :

- En tant qu'utilisateur, je peux voir toutes mes listes de films.
- En tant qu'utilisateur, je peux créer une liste de films.
- En tant qu'utilisateur, je peux voir les détails d'une liste de films.
- En tant qu'utilisateur, je peux marquer (`bookmark`) un film dans une liste de films.
- En tant qu'utilisateur, je peux détruire un `bookmark`.

**Attention** les films seront créés dans la base de données avec une seed, il n'est donc pas nécessaire d'implémenter aucune action utilisateur autour du modèle de `movie`.

## Générer l'application Rails

**Remarque** : Tu devrais maintenant pouvoir exécuter ces étapes sans cette fiche d'aide ! N'oublie pas la base de données `-d postgresql` (on en parlera au prochain cours). 😉

```bash
cd ~/code/<user.github_nickname>
rails new rails-watch-list -d postgresql --skip-action-mailbox -T
cd rails-watch-list
```

On doit ensuite créer la base de données postgresql pour cette nouvelle application Rails.

```bash
rails db:create
```

On va maintenant configurer git, créer un dépôt sur Github et pousser notre squelette.

```bash
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
```

On va importer les spécifications du prof pour évaluer notre progression avec `rspec`. Note: Tu utiliseras la commande `rspec` au lieu de la commande `rake` pour exécuter les tests de ce défi.

```bash
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
rails db:migrate
rails db:test:prepare
git submodule add https://github.com/lewagon/fullstack-challenges-04-Rails-watch-list-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
```

Tu pourras tester ton code avec :

```bash
rails db:migrate RAILS_ENV=test  # If you added a migration
rspec spec/models                # Launch tests
```

Avant de commencer à coder, n'oublie pas de configurer ton application Rails pour le front-end. Comme dans le cours de ce matin, Rails 8 utilise Propshaft par défaut, mais la gem `bootstrap` nécessite Sprockets :

```ruby
# Gemfile

# SUPPRIMER cette ligne :
# gem "propshaft"

# AJOUTER ces gems :
gem "sprockets-rails"
gem "sassc-rails"
gem "bootstrap", "~> 5.3"
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form"
```

```bash
bundle install
rails generate simple_form:install --bootstrap
```

Puis on va télécharger les feuilles de style du Wagon :

```bash
rm -rf app/assets/stylesheets
curl -L https://github.com/lewagon/rails-stylesheets/archive/master.zip > stylesheets.zip
unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-master app/assets/stylesheets
```

Crée le fichier manifest de Sprockets (Rails 8 ne l'a pas par défaut) :

```bash
mkdir -p app/assets/config
touch app/assets/config/manifest.js
```

```js
// app/assets/config/manifest.js
//= link_tree ../images
//= link_tree ../../javascript .js
//= link_directory ../stylesheets .css
```

Mets à jour ton layout pour utiliser le bon tag stylesheet :

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- remplace cette ligne -->
<%= stylesheet_link_tag :app, "data-turbo-track": "reload" %>
<!-- par celle-ci -->
<%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
```

Maintenant, on va importer la bibliothèque JavaScript Bootstrap avec `importmap` :

```bash
importmap pin bootstrap
```

Dans `application.js`, on va ajouter les lignes suivantes :

```js
// app/javascript/application.js
import "@popperjs/core";
import "bootstrap";
```

Ajoute les fichiers JS de Bootstrap à ton manifest :

```js
// app/assets/config/manifest.js
//= link_tree ../images
//= link_tree ../../javascript .js
//= link_directory ../stylesheets .css
//= link popper.js
//= link bootstrap.min.js
```

Enfin, dans `config/importmap.rb`:

```rb
# config/importmap.rb

# remplace ces lignes :
# pin "bootstrap" # @5.3.2
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8

# par celles-ci :
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
```

N'oublie pas de versionner (`commit`) et pousser (`push`) régulièrement ton travail.

## Spécifications

### 1 - Modèles

Va sur [kitt.lewagon.com/db](http://kitt.lewagon.com/db) et dessine le schéma avec ton buddy. Les tables
dont on a besoin sont `movies`, `lists` et `bookmarks`. Réfléchis aux relations entre les tables et à qui stocke les _références_. 😉

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/db.png)

**Important**

N'utilise pas `rake` mais :

```bash
rspec spec/models
```

pour exécuter uniquement les tests dans le dossier `spec/models`. Assure-toi que tout soit en vert avant de passer à la partie applicative du challenge.

#### Attributs

- Un **film** a un **titre** (par ex. : `"Wonder Woman 1984"`), un **aperçu** (`"Wonder Woman entre en conflit avec l'Union soviétique pendant la Guerre Froide dans les années 1980 !"`), une **URL d'affiche** et une **note** (6.9).
- Une **liste** a un **nom** (par ex. :  `"Drama"`, `"Comedy"`, `"Classic"`, `"To rewatch"`, ... )
- Un **signet** ajoute un film à une liste (par ex. : Wonder Woman a été ajouté à la watch-list "Girl Power"). Chaque **signet** fait référence à un film et une liste, avec un **commentaire**. Le champ **commentaire** permet à l'utilisateur d'ajouter une remarquer au signet (par ex. : Alan Turing a recommandé ce film).

#### Validation

- Un film doit avoir un titre unique et un aperçu.
- Une liste doit avoir un nom unique.
- Un signet doit être lié à un film et une liste, et les associations [film, liste] doivent être uniques.
- Le commentaire associé à un signet ne peut pas avoir moins de 6 caractères.

#### Associations

- Une liste a plusieurs signets
- Une liste a plusieurs films avec des signets
- Un film a plusieurs signets
- Un signet appartient a un film
- Un signet appartient à une liste
- Tu ne peux pas supprimer de film s'il est indiqué en référence dans au moins un signet
- Quand tu supprimes une liste, tu dois supprimer tous les signets associés (mais pas les films, car ils peuvent être indiqués en référence dans d'autres listes)

### 2 - Générer une seed des films

**Notre application ne permettra pas aux utilisateurs de créer des films**.
À la place, on va générer une seed statique de films parmi lesquels l'utilisateur pourra choisir.
Voici un exemple de seed :

```ruby
# db/seeds.rb
Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
```

### Optionnel :

Amuse-toi et ajoute de faux films avec la [gem faker](https://github.com/faker-ruby/faker).

Encore mieux : utilise de vrais films avec [cette API](https://developers.themoviedb.org/3/movies/get-top-rated-movies) (avec les librairies Ruby `open-uri` et `json`).

**Configuration de l'API**

Les endpoints de l'API nécessitent que tu t'inscrives et génères une clé API. La procédure étant un peu longue, au Wagon, on t'a généreusement fourni un **proxy** pour cette API. Grâce à ce proxy, tu pourras utiliser cette API sans avoir à générer de clé API. On te fait confiance pour utiliser cet outil uniquement pour ce challenge !

Voici comment ça fonctionne :

1. L'API indique : utilise `https://api.themoviedb.org/3/movie/top_rated?api_key=<your_api_key>`.
2. Remplace cette partie de l'URL `https://api.themoviedb.org/3?api_key=<your_api_key>` par `https://tmdb.lewagon.com`. Par example, `https://api.themoviedb.org/3/movie/top_rated?api_key=<your_api_key>` serait `https://tmdb.lewagon.com/movie/top_rated`.
3. Tu peux [essayer ici](https://tmdb.lewagon.com/movie/top_rated).

**Images de films**

Pour comprendre comment obtenir les images de films de l'API, lis attentivement [cette page](https://developers.themoviedb.org/3/getting-started/images) dans la documentation.

### 3 - Routes, contrôleur et vues pour les listes

**Important**
N'utilise pas `rspec` pour coder la partie applicative. On va maintenant lancer `rails s` dans le terminal et ouvrir un navigateur sur [http://localhost:3000/](http://localhost:3000/). Rédige toujours ton code en silos :

- Commence par la **route**,
- puis code le **contrôleur**,
- et enfin code la **vue** et rafraîchis ton navigateur.

Une fois que ta fonctionnalité est prête (et a l'air de fonctionner), passe à la suivante. Et ainsi de suite !

Une fois que tu as terminé **tout** le challenge, utilise `rspec` pour t'assurer qu'il répond aux spécifications.

**Fonctionnalités**

Une fois encore, tu dois avoir une idée précise des fonctionnalités de ton application pour créer tes routes. Voici la liste des fonctionnalités :

- Un utilisateur peut voir toutes les listes

```
GET "lists"
```

- Un utilisateur peut voir les détails d'une liste donnée et son nom

```
GET "lists/42"
```

- Un utilisateur peut créer une nouvelle liste

```
GET "lists/new"
POST "lists"
```

### 4 - Routes, contrôleur et vues pour les signets

- Un utilisateur peut ajouter un nouveau signet (association film/liste) à une liste existante
- Consulte la [documentation](https://github.com/heartcombo/simple_form#associations) `simple_form` à propos de `f.association` pour créer facilement une sélection dépliante de notre liste de films.

```
GET "lists/42/bookmarks/new"
POST "lists/42/bookmarks"
```

- Un utilisateur peut supprimer un signet d'une liste. Comment crée-t-on un lien de suppression ?

```
DELETE "bookmarks/25"
```

A-t-on besoin d'un contrôleur  `MoviesController` ?

### 5 - Mise en page au fil de l'eau

On va maintenant créer un chouette front-end ! Pour cela, on va jouer avec le CSS 😊 Est-ce que tu rejoindras le Hall of Fame ? Jette un œil à [dribbble](https://dribbble.com/) ou [onepagelove](https://onepagelove.com/) pour trouver l'inspiration.

N'oublie pas que tu peux avoir des images locales dans le dossier `app/assets/images`. Encore mieux : tu peux demander à l'utilisateur une `image_url` au moment de l'envoi.

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/homepage.png)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/showpage.png)

### 6 - Formulaire de nouveau signet sur la page d'affichage d'une liste (optionnel)

Essaie de placer le formulaire de nouveau signet sur la page de la liste, pas sur une page séparée, pour ne pas avoir à quitter la page de la liste pour ajouter un nouveau film ! Qu'est-ce que ça change dans les routes ? Et dans les contrôleurs ?

### 7 - Avis sur les listes (optionnel)

Tout le monde devrait pouvoir commenter et donner son avis sur notre collection de films. On va donc ajouter des avis à nos listes !

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/reviews.png)
