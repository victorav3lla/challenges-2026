## AI Week - Démos intermédiaires

À ce stade, tu devrais avoir des utilisateurs et une première fonctionnalité qui fonctionne en utilisant une API LLM, avec un system prompt opérationnel.

Aujourd'hui, tu devrais ajouter le comportement de conversation dans ton app pour permettre aux utilisateurs de **faire des suivis** sur une réponse LLM, en **gardant le contexte** des messages précédents.

Aussi, au fur et à mesure que les conversations grandissent, assure-toi de contrôler la consommation de tokens avec les garde-fous appropriés, et corrige le comportement de défilement agaçant en répondant avec des **Turbo Streams** plutôt qu'une redirection.

Aussi, comme vu pendant le deuxième cours, tu peux affiner ton frontend et ajouter un **comportement interactif dans ton UI** avec JavaScript, en l'implémentant avec de simples contrôleurs Stimulus.

Enfin, n'oublie pas de préparer ta **démo intermédiaire** : gèle les déploiements à mi-session et concentre-toi sur les tests de ton parcours utilisateur jusqu'à ce qu'il soit parfait. Toutes les démos doivent être faites en production, pas de localhost autorisé. Assure-toi de préparer l'environnement de production avec des [seeds](https://kitt.lewagon.com/knowledge/cheatsheets/rails_seeds) bien pensés.