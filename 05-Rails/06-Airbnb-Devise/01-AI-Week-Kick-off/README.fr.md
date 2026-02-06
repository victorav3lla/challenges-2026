## AI Week - Lancement

Tu vas passer les prochaines sessions avec ton groupe de projet à travailler sur un Assistant IA pour un **Utilisateur/utilisatrice** avec un **Objectif**. Par exemple, Wott est un Assistant IA pour **des étudiants apprenant à coder**. Tu voudras réfléchir au "persona" de ton utilisateur principal ("étudiant apprenant à coder") et à son objectif ("Je suis bloqué sur un problème et je veux que l'IA le résolve pour moi"). Cela t'aidera à définir la portée de ton application.

Fais un brainstorming avec ton groupe et crée un ticket pour valider votre idée avec un enseignant.

### Demos

Vous présenterez votre travail (en production, pas de demo en `localhost` !) pendant les sessions **Multi-modal inference** et **Tools & Agents**. Les deadlines sont importantes !

### Partie I

Travaille sur les étapes suivantes et valide-les avec un enseignant au début de la session avant de créer ton application Rails et de passer à la Partie II. Tu gagneras beaucoup de temps en faisant cela, fais-nous confiance.

#### 1 - User stories

Duplique ce [tableur](https://docs.google.com/spreadsheets/d/1Kh4r-r5ZDyaWSfJdvW1NQJEfqt-wO3ExFR9SVp29lpY/edit?gid=0#gid=0) (1 par équipe) et invite tes coéquipiers à collaborer.

![duplicate](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/duplicate.png)
![rename](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/rename.png)

Commence par réfléchir aux **parcours utilisateur** que tu vas présenter lors de la démo. Il y a beaucoup d’usages possibles pour un Assistant IA, mais essaie de les réduire au minimum viable pour résoudre un problème précis.

<details><summary markdown='span'>Voir solution
</summary>

- 1 parcours utilisateur pour l’utilisateur naviguant dans les challenges (ou le contexte de ton choix)
- 1 parcours utilisateur pour l’utilisateur ajoutant de nouveaux challenges
- 1 parcours utilisateur pour l’utilisateur modifiant ou supprimant les challenges qu’il a créés
- 1 parcours utilisateur pour l’utilisateur discutant avec l’IA à propos d’un challenge (ou le contexte de ton choix)
</details>

Chaque parcours utilisateur contient plusieurs **user stories** : écris-les dans le tableur en utilisant la bonne terminologie. Une fois terminé, crée un ticket pour les faire valider par un enseignant.

Tu peux faire des croquis rapides au stylo et papier des différents écrans et des éléments qu’ils contiennent. Cela t’aidera à visualiser tes parcours utilisateur. Attention, pas besoin d’être trop précis à ce stade ! C’est un sprint, tu dois allouer ton temps et tes ressources intelligemment.

<details><summary markdown='span'>Voir solution
</summary>
- En tant que visiteur, je peux visiter la page d’accueil pour voir la proposition de valeur de l’application
- En tant que visiteur, je peux voir la liste des challenges pour naviguer vers celui que je souhaite faire
- En tant que visiteur, je peux cliquer sur un challenge pour lire les instructions
- En tant qu’utilisateur, je peux afficher un formulaire pour remplir les informations nécessaires à la création d’un nouveau challenge
- En tant qu’utilisateur, je peux soumettre le formulaire pour créer le challenge
- En tant qu’utilisateur, je peux afficher un formulaire pour modifier un challenge que j’ai créé
- En tant qu’utilisateur, je peux soumettre le formulaire pour mettre à jour le challenge
- En tant qu’utilisateur, je peux supprimer un challenge que j’ai créé
- En tant qu’utilisateur, je peux créer une conversation avec l’Assistant IA à propos d’un challenge
- En tant qu’utilisateur, je peux voir la liste des conversations que j’ai créées avec l’Assistant IA à propos d’un challenge
- En tant qu’utilisateur, je peux naviguer vers une conversation que j’ai créée avec l’Assistant IA à propos d’un challenge
- En tant qu’utilisateur, je peux envoyer un message à l’Assistant IA dans le contexte d’une conversation
- En tant qu’utilisateur, je peux envoyer un message avec un fichier joint à l’Assistant IA
- En tant qu’utilisateur, je peux envoyer un message de suivi à l’Assistant IA
</details>

#### 2 - Schéma de la base de données

Dessine ton schéma de base de données avec [notre outil db](https://kitt.lewagon.com/db/new) et **crée un ticket pour le faire valider avec un enseignant**. Dessine uniquement le minimum viable pour que ton app fonctionne. Utilise les bonnes conventions (noms au pluriel pour les tables... etc – cf. les cours DB).

💡 Pour harmoniser la manière de stocker les questions utilisateurs et les réponses de l’assistant, tu peux inclure la table suivante ainsi que la table users pour gérer les connexions et inscriptions.

<details><summary markdown='span'>Voir solution
</summary>
  <img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/3h0por8ku29vrntndn0ci30fobb7" alt="Schéma de base de données montrant quatre tables : users, challenges, chats et messages, leurs relations et colonnes">
</details>

#### 3 - Routes

Retourne à ton tableur User stories et ajoute les informations suivantes :
- Route : Verbe + Chemin
- Action
- Contrôleur

Crée un ticket pour les faire valider avec un enseignant. Tout est bon ? C’est le moment du `rails new` !

### Partie II

Avant de répartir les tâches dans l’équipe, configurez le projet ensemble. Le **lead developer** (et lui seul) doit :

#### 1. Créer le projet Rails avec configuration Postgres

Utilise le template minimal de Le Wagon, qui contient déjà une bonne configuration front-end :

```bash
cd ~/code/<user.github_nickname>
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/minimal.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```

Encore une fois, seul le lead developer fait ça ! Pas toute l’équipe.

#### 2. Pousser le projet sur Github

```bash
cd your-rails-app-name
gh repo create --public --source=.
git push origin master
```

#### 3. Ajouter tes coéquipiers comme collaborateurs sur le repo Github
Va dans les paramètres de ton repo Github (`https://github.com/<user.github_nickname>/your-rails-app-name/settings/collaboration`) et ajoute tes coéquipiers comme collaborateurs.

Les autres pourront ensuite cloner le projet. ⚠️ Fais attention, utilise l’URL SSH ⚠️

Ensuite, ils doivent lancer :

```bash
bundle install
rails db:create db:migrate
```

#### 4. Déployer sur Heroku

Même si c’est juste une app squelette, c’est important de déployer sur Heroku **dès le premier jour**, puis déployer continuellement chaque jour avec chaque nouvelle feature.

```bash
heroku create ai-assistant-<user.lower_github_nickname> --region=REPLACE_WITH_REGION # (eu, us, ou toute région disponible dans `heroku regions`)
heroku config:set WEB_CONCURRENCY=1 # corrige un bug temporaire Heroku
git push heroku master
heroku run rails db:migrate
```

### 5. GitHub Project

Un [tableau Kanban](https://fr.wikipedia.org/wiki/Kanban) est un outil de gestion de projet agile conçu pour visualiser le travail, suivre la progression et maximiser l’efficacité (ou le flow).

Draft Github Projects – Pour configurer un kanban sur Github, il faut d’abord avoir créé le repo et ajouté tous les collaborateurs. Ensuite, un membre peut utiliser [ce tableau](https://github.com/orgs/lewagon/projects/117) comme base. Suis les instructions [ici](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project) pour copier et ajouter ce tableau à ton repo. Note que Github ne copie pas les cartes, tu devras donc les ajouter toi-même. Tu peux copier/coller les cartes pour démarrer ou partir de zéro. Aussi, Github utilise la syntaxe markdown pour formater le texte (titres, styles, cases à cocher). Ce n’est pas obligatoire, mais ça peut améliorer la lisibilité. Plus d’infos [ici](https://guides.github.com/features/mastering-markdown/).

Chaque tâche doit être formulée sous forme de **User Story**, par exemple : `En tant qu'utilisateur, je peux voir une liste de tous les défis`.

Dans le champ de priorité, vous pouvez utiliser la méthode MoSCoW pour classer vos user stories en fonction de leur importance : Must have (Doit avoir), Should have (Devrait avoir), Could have (Pourrait avoir), Won't have (N'aura pas). Cette méthode vous aidera à vous concentrer sur les user stories les plus importantes en premier.

Dans le champ de parcours, vous pouvez inclure le verbe, le chemin, le contrôleur et l'action, comme : `GET /challenges challenges index`, tout comme vous l'avez dans la feuille de calcul.

Assurez-vous d'utiliser la [fonction d'assignation sur GitHub](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/assigning-issues-and-pull-requests-to-other-github-users?ref=codebldr) pour identifier le membre de l'équipe qui travaillera sur chaque user story.

À partir de ce point, vous pouvez commencer à diviser les tâches. **Passez du temps sur la configuration, car tout sera plus simple si vous le faites correctement dès le début**.

### Quelques conseils pour la gestion de projet

#### Lancement

Maintenant, mettons l'équipe au travail sur le projet. Le lead developer a déjà créé l'application Rails, l'a poussée sur Github et l'a déployée sur Heroku.

#### Ajoute tes coéquipiers comme collaborateurs sur le repo Github

Va dans les paramètres de ton repo Github (`https://github.com/<user.github_nickname>/rails-airbnb-clone/settings/collaboration`) et ajoute tes coéquipiers comme **collaborateurs**.

Les autres coéquipiers peuvent maintenant **cloner** le projet :

```bash
gh repo clone <owner-github-nickname>/<rails-app-name>
```

Ensuite, ils doivent naviguer dans le répertoire et lancer :

```bash
cd <rails-app-name>
rails db:create db:migrate
bundle install
```

Vous pouvez maintenant diviser votre équipe en deux groupes pour commencer à faire du pair programming sur quelques fonctionnalités clés de votre app. C'est un bon moyen de démarrer et de vous assurer que vous êtes tous alignés.

C'est l'occasion d'en apprendre davantage sur le [Pair programming](https://fr.wikipedia.org/wiki/Programmation_en_bin%C3%B4me) :

> La programmation en binôme est une technique de développement logiciel dans laquelle deux programmeurs travaillent ensemble sur un poste de travail. L'un, le conducteur, écrit le code tandis que l'autre, l'observateur ou navigateur, examine chaque ligne de code au fur et à mesure qu'elle est tapée. Les deux programmeurs échangent fréquemment les rôles.

Voici 3 points sur lesquels tu peux déjà commencer à travailler :

**Scope 1: Setup Devise** :
- Configure Devise et génère le modèle `User` avec devise. Assure-toi d'utiliser `rails g devise User` (pas `rails g model`) !
- Suis la conférence du matin pour ajouter la navbar, les pages d'inscription et de connexion (avec Bootstrap cols), et configure les filtres `before_action` et `skip_before_action`.

**Scope 2: Kick-start Front-end** :
- Construis une page d'accueil simple et attractive avec un container Bootstrap, un contenu centré, et une proposition de valeur claire.

**Scope 3: Génération des modèles** :
- _Note : Devise doit d'abord être configuré ! (Scope 1)_
- Générer les trois autres modèles te permettra de répartir le travail plus facilement après la conférence **Coder en équipe**.

**(Optionnel) Scope 4: Actions Read du modèle principal** :
Félicitations si tu arrives à cette étape ! Commençons à coder les user stories suivantes sur le modèle principal de ton projet (en remplaçant "challenges" par le tien) :
- En tant que visiteur, je peux voir la liste des challenges pour naviguer vers celui que je souhaite explorer.
- En tant que visiteur, je peux cliquer sur un challenge pour voir ses détails

Pour chaque scope sur lequel tu travailles, n'oublie pas :

```bash
git checkout -b <feature-name>
```

Et ensuite d'ouvrir une pull request sur Github quand tu as terminé.

N’oublie pas de déployer ton travail en continu sur Heroku, et de partager ton URL de production sur Slack avant de partir.

#### Organisation des tâches

Dans les ~10 user stories du tableur, **certaines fonctionnalités sont plus importantes que d’autres**. C’est à toi de les prioriser pour avoir un MVP à la fin de la semaine !

#### Coder en silo, du modèle à la vue

Quand tu travailles sur une fonctionnalité, fais-le **consciencieusement du modèle jusqu’au HTML/CSS**. Prenons l’exemple de la création d’un challenge :

*Modèle*
- Je vais générer un modèle `Challenge` et sa migration associée.
- Ensuite j’écris un modèle fonctionnel avec associations et validations.
- Je teste mon modèle dans la console Rails pour être sûr que tout marche.

*Routing* :
- J’ajoute les routes new/create dans `routes.rb`

*Contrôleur* :
- J’ajoute deux actions `new` et `create` dans `ChallengesController`

*Vues* :
- Je code le formulaire dans `views/challenges/new.html.erb`
- L’action create redirige vers la vue `show` avec un message de confirmation

*Liens* :
- J’ajoute un lien pour créer un Challenge dans la navbar.

*HTML/CSS* :
- Mes formulaires sont propres avec les classes Bootstrap correctes pour les inputs et boutons.
- Ma page new challenge est propre avec un `container` centré, des headers clairs, et un design épuré pour chaque booking.
- Je prends le temps de refactorer mon HTML avec des partials si le code est trop long ou difficile à lire.

**Code-le parfaitement, du modèle à la vue**

- Teste bien toutes tes associations et validations en console Rails.
- Ne néglige pas la vue. Si tu ajoutes un formulaire, fais-le joli, centré et responsive avec Bootstrap. Si tu codes une liste de flats, construis une grille Bootstrap agréable (par ex. image à gauche, infos à droite).
- Utilise des partials pour rendre ton HTML plus lisible et maintenable.
