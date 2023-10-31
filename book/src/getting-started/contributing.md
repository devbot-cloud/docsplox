# Getting Started

An entrypoint to getting started with contributing to the project.

# Contributing

- [Communication](#communication)
- [Git workflow](#git-workflow)
- [Open a Merge Request](#opening-a-merge-request)
- [Code Review](#code-review)
- [Best Practices](#best-practices)
- [Testing](#testing)
- [Documentation](#documentation)
- [Issues Management or Triage](#issues-management-or-triage)

In order to avoid forcing people to be "at work" effectively 24/7, we want to establish some semi-formal protocols around development.
Hopefully, these rules make things go more smoothly.
If you find that this is not the case, please complain loudly.

As a potential contributor, your changes and ideas are welcome at any hour of the day or night, weekdays, weekends, and holidays.
Please do not ever hesitate to ask a question or send a merge request.

Check out our [code review expectations](#expectations) on how to create great code as a big group.

Beginner focused information can be found below in [Open a merge Request](#opening-a-merge-request) and [Code Review](#code-review).


### Communication

It is best to contact your team lead for issues related to the project's topic. Your team lead will be able to help you much more quickly than a general question would.

For general questions and troubleshooting, use the `general` or `faq` channels.

## Git workflow

To check out code to work on, please refer to [the Git Workflow Guide](git-workflow.md).

The full workflow for a merge request is documented here: 

- [team-specific git workflow](merge-requests.md#the-testing-and-merge-workflow).

That document is comprehensive and detailed, for purposes of a typical merge request we will cover the initial and simple use case here:

## Opening a Merge Request

Merge requests are often called a "MR".

Common new contributor MR issues are:

* Finding the right Approver or reviewer(s) for the MR (see [Code Review](#code-review) section) and following any repository specific contributing guidelines.
* Dealing with test cases which fail on your MR, unrelated to the changes you introduce.
* Include mentions (like @person) and keywords which could close the issue (like fixes #xxxx) in commit messages.

## Code Review

There are two aspects of code review: giving and receiving.

To make it easier for your MR to receive reviews, consider the reviewers will need you to:

* Follow the project [coding conventions](coding-conventions.md)
* Write [good commit messages](https://chris.beams.io/posts/git-commit/)
* Break large changes into a logical series of smaller patches which individually make easily understandable changes, and in aggregate solve a broader issue
* Label MRs with appropriate labels and reviewers.

Reviewers, the people giving the revie
When reviewing MRs from others [The Gentle Art of Patch Review](http://sage.thesharps.us/2014/09/01/the-gentle-art-of-patch-review/) suggests an iterative series of focuses which is designed to lead new contributors to positive collaboration without inundating them initially with nuances:

* Is the idea behind the contribution sound?
* Is the contribution architected correctly?
* Is the contribution polished?

Note: if your pull request isn't getting enough attention, you can use the `#mr-reviews` channel to get help finding reviewers.

### Expectations
We believe in the value of code review for all contributions. Code review increases both the quality and readability of our codebase, which in turn produces high quality software.
See the [pull request documentation](merge-requests.md) for more information on code review.
Consequently, we expect that all active contributors will also be active reviewers.

## Best practices

- Write clear and meaningful git commit messages.
- If the MR will *completely* fix a specific issue, include `fixes #123` in the PR body (where 123 is the specific issue number the PR will fix). This will automatically close the issue when the PR is merged.
- Make sure you don't include `@mentions` or `fixes` keywords in your git commit messages. These should be included in the MR body instead.
- When you make a MR for small change (such as fixing a typo, style change, or grammar fix), please squash your commits so that we can maintain a cleaner git history.
- Make sure you include a clear and detailed PR description explaining the reasons for the changes, and ensuring there is sufficient information for the reviewer to understand your PR.
- Additional Readings: 
    - [chris.beams.io/posts/git-commit/](https://chris.beams.io/posts/git-commit/)
    - [github.com/blog/1506-closing-issues-via-pull-requests ](https://github.com/blog/1506-closing-issues-via-pull-requests)
    - [davidwalsh.name/squash-commits-git ](https://davidwalsh.name/squash-commits-git)
    - [https://mtlynch.io/code-review-love/](https://mtlynch.io/code-review-love/)

## Testing

Testing is the responsibility of all contributors.
Refer to the [Testing Guide](/contributors/devel/sig-testing/testing.md) for more information.

There are multiple types of tests.
The location of the test code varies with type, as do the specifics of the environment needed to successfully run the test:

* **Unit**: These confirm that a particular function behaves as intended. Unit test source code can be found adjacent to the corresponding source code within a given package. These are easily run locally by any developer on any OS.
* **Integration**: These tests cover interactions of package components or interactions between kubernetes components and some other non-kubernetes system resource (eg: etcd).  An example would be testing whether a piece of code can correctly store data to or retrieve data from etcd. Running these can require the developer set up additional functionality on their development system.
* **End-to-end** ("e2e"): These are broad tests of overall system behavior and coherence.  These are more complicated as they require a functional kubernetes cluster built from the sources to be tested. A separate [document detailing e2e testing](/contributors/devel/sig-testing/e2e-tests.md) 
* **Conformance**: These are a set of testcases, currently a subset of the integration/e2e tests, that the Architecture SIG has approved to define the core set of interoperable features that all Kubernetes deployments must support. For more information on Conformance tests please see the [Conformance Testing](/contributors/devel/sig-architecture/conformance-tests.md) Document.

Continuous integration will run these tests either as pre-submits on MRs, post-submits against main/release branches, or both.  
The results appear on [testgrid](https://testgrid.k8s.io).

If you're looking to run e2e tests on your own infrastructure, [kubetest](https://git.k8s.io/test-infra/kubetest) is the mechanism.


## Documentation
To check out documentation requirements, please refer to the Documentation Style Guide.
- [Documentation Style Guide](../styleguide/documentation-guide.md)

## Issues Management or Triage

Have you ever noticed the total number of open issues?
Helping to manage or triage these open issues can be a great contribution and a great opportunity to learn about the various areas of the project.
Triaging is the word we use to describe the process of adding multiple types of descriptive labels to GitHub issues, in order to speed up routing issues to the right folks.
Refer to the [Issue Triage Guidelines]() for more information.