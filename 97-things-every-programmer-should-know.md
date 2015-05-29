# Act with Prudence

At the beginning of an iteration, you'll find yourself having to choose between "doing it right" and "doing it quick". It is often appealing to "do it quick" with the understanding that you'll come back and fix it later.

The next iteration brings new problems and you become focused on them. This sort of deferred work is known as technical debt. The longer you leave it, the worse it gets.

# Automate Your Coding Standard

During the kick-off meeting, the lead developer goes through the document and everybody agrees that they will try to follow them. Once the project gets underway these good intentions are abandoned, one at a time. When the project is finally delivered, the code looks like a mess.

Well-formatted code doesn't earn you points with a customer that wants more functionality.

One reason to format the code in a uniform way is so that nobody can "own" a piece of code just by formatting it in his or her private way.

Automate your coding standard.

# Before you refactor

Avoid the temptation to rewrite everything. Throwing away old production code means that you are throwing away months of tested, reviewed code.

Prefer incremental changes to massive changes. It is no fun to see a hundred test failures after you make a change.

Add new tests if the existing tests are not sufficient to cover the changes you made.

If something isn't broken, why fix it?

Do not refactor based on new tech.

# Code in the Language of the Domain

If you don't code using domain terms you are creating a secret. The next programmer to come along might not be in on the secret, so why not make it explicit?

Making domain concepts explicit in your code means other programmers can gather the intent of the code much more easily than by trying to retrofit an algorithm into what they understand about a domain.

The programmer who comes along a few months later to work on the code will thank you. The programmer who comes along a few months later might be you.
