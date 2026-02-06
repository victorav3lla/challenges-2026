## Semaine IA - Continue à construire

À ce stade, tu devrais déjà avoir une application Rails de base déployée sur Heroku, avec un modèle principal. Si ce n'est pas le cas, merci de créer un ticket.

#### Créer une nouvelle branche pour ta fonctionnalité

Rappelle-toi que tu veux travailler en construisant des user stories 💡 Tu n'auras pas beaucoup de succès si tu essaies d'avoir un coéquipier qui construit les contrôleurs et un autre qui construit les vues séparément 😠 Habituellement, construire une user story jusqu'à son terme nécessitera une route, une action de contrôleur, et une vue. Donc, il est temps de regarder les user stories listées dans ton tableur, de déterminer lesquelles tu veux construire en premier, puis de les distribuer entre tes coéquipiers pour commencer à coder :

```bash
git checkout -b <feature-name>
code .
```

> [!WARNING]
> À partir de maintenant, tu ne devrais plus commiter sur `master`.

Une fois que ton équipe a généré les fichiers de modèle, vous devriez tous pouvoir commencer à construire vos fonctionnalités. Les périmètres ci-dessous sont des suggestions sur comment tu pourrais répartir le travail entre tes coéquipiers. Pour chacun d'eux (sauf les seeds), tu devras construire des routes, des actions de contrôleur, et des vues. Note que nous disons "challenge" comme modèle d'exemple pour notre app de test des cours magistraux, mais tu devrais toujours remplacer ce mot par le nom du modèle principal de ton projet :

**Périmètre 0 : Seed**
Avant de pouvoir travailler sur les Périmètres 1 et 3, tu as besoin d'enregistrements de ton modèle principal dans ta base de données. Tu peux créer des enregistrements dans ta `rails console`, mais avoir un fichier de seed est très utile pour le développement. Consulte [ce tutoriel](https://kitt.lewagon.com/knowledge/cheatsheets/rails_seeds?course_ats_slug=web).

**Périmètre 1 : Index + Show**
- En tant que visiteur, je peux voir une liste de challenges pour naviguer vers le challenge que je veux explorer.
- En tant que visiteur, je peux cliquer sur un challenge pour voir ses détails

**Périmètre 2 : New + Create**
- En tant qu'utilisateur, je peux afficher un formulaire pour remplir les informations requises pour créer un nouveau challenge
- En tant qu'utilisateur, je peux soumettre le formulaire pour créer le nouveau challenge

**Périmètre 3 : Edit + Update**
- En tant qu'utilisateur, je peux afficher un formulaire pour éditer un challenge que j'ai créé
- En tant qu'utilisateur, je peux soumettre le formulaire pour mettre à jour le challenge

### Ajouter l'IA
Maintenant que tu as une application Rails de base avec un modèle principal, il est temps d'ajouter des capacités d'IA.
Si tu ne l'as pas encore fait, configure RubyLLM dans ton app, en suivant le cours d'Introduction aux LLM.

C'est le point de départ pour ajouter les user stories liées à l'IA :
- En tant qu'utilisateur, je peux créer un chat avec l'Assistant IA à propos d'un challenge.
- En tant qu'utilisateur, je peux voir la liste des chats que j'ai créés avec l'Assistant IA à propos d'un challenge.
- En tant qu'utilisateur, je peux naviguer vers un chat que j'ai créé avec l'Assistant IA à propos d'un challenge.
- En tant qu'utilisateur, je peux envoyer un message à l'Assistant IA dans le contexte d'un chat.

Sur cette partie, chaque cours de la Semaine IA te guidera sur comment progresser. Cela dit, n'attends pas pour commencer à implémenter ces actions.

Pour rappel, nous recommandons d'ajouter une table `chats` et une table `messages` avec les champs suivants 👇 pour anticiper les améliorations futures.

<details><summary markdown='span'>Voir le schéma DB
</summary>
  <img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/3h0por8ku29vrntndn0ci30fobb7" alt="Schéma de base de données montrant quatre tables : users, challenges, chats et messages, leurs relations et colonnes">
</details>

Rappelle-toi que les **chats** sont créés dans le contexte d'un "challenge", et que les **messages** sont créés dans le contexte d'un **chat**. Si tu as besoin d'un rappel sur ce type de relation, retourne à la section **Nested Resources** du cours **Advanced Routing**.

Et bien sûr, si tu as des difficultés, crée un ticket !

### System Prompt
Ensuite, tu travailleras sur le **system prompt** de ton Assistant IA et t'assureras que chaque requête API est envoyée avec le `with_instructions(system_prompt)` approprié, pour façonner le comportement de ton Assistant IA selon ta persona et ton objectif.

Rappelle-toi qu'un bon prompt devrait inclure :
- **Persona** : Comme qui l'IA devrait-elle agir ?
- **Contexte** : À quoi servira la sortie et par qui (c'est-à-dire l'utilisateur), et toute donnée pertinente à transmettre avec l'input utilisateur.
- **Tâche** : généralement définie par l'utilisateur, mais elle devrait être claire, directe et spécifique.
- **Format** : Comment la sortie devrait être structurée (ex. JSON, Markdown, etc.).