## AI Week - Intermediate Demos

At this point, you should have users and a first functioning feature using an LLM API, with a working system prompt.

Today you should add the conversation behaviour in your app to allow users to **follow-up** on an LLM answer, **keeping the context** of the previous messages.

Also as conversations grow, make sure to control tokens consumption w/ the appropriate guard rails, and fix the annoying scrolling behaviour by responding with **Turbo Streams** rather than a redirection.

Also, as seen during the second lecture, you can refine your frontend and add **interactive behaviour in your UI** with JavaScript, implementing it with simple Stimulus controllers.

Last, don't forget to prepare your **intermediate demo**: freeze deployments at mid-session and focus on testing your user journey until it's perfect. All demos must be done in production, no localhost allowed. Make sure you prepare the production environment with well-thought [seeds](https://kitt.lewagon.com/knowledge/cheatsheets/rails_seeds).
