# Git Workflow
This doc explains how to start contributing through git and Merge Requests. It should serve as a reference for all contributors, and be useful especially to new and infrequent submitters.
## 1. Clone clone the repo to local storage

Create your clone:

```bash
mkdir -p $working_dir
cd $working_dir
git clone git@gitlab.com:$group/$subgroup/$project.git

cd $project
git remote add upstream git@gitlab.com:$group/$subgroup/$project.git

# Never push to upstream main
git remote set-url --push upstream no_push

# Confirm that your remotes make sense:
git remote -v
```

## 2. Create a Working Branch

Get your local main up to date.

```bash
cd $working_dir/$project
git fetch upstream
git checkout main
git rebase upstream/main
```

Create your new branch.

```bash
git checkout -b myfeature
```

You may now edit files on the `myfeature` branch.

## 3. Keep your branch in sync

You will need to periodically fetch changes from the `upstream`
repository to keep your working branch in sync.

Make sure your local repository is on your working branch and run the
following commands to keep it in sync:

```bash
git fetch upstream
git rebase upstream/main
```

Please don't use `git pull` instead of the above `fetch` and
`rebase`. Since `git pull` executes a merge, it creates merge commits. These make the commit history messy
and violate the principle that commits ought to be individually understandable
and useful (see below). 

You might also consider changing your `.git/config` file to change the behavior of `git pull` 
```bash
# git pull --rebase
git config branch.autoSetupRebase always
```

## 4. Commit Your Changes

Add changes to staging area
```bash
git add README.md
```

Commit your changes with a descriptive message
```bash
git commit -m "Added versioning section"
```

Once ready, push your changes your branch `myfeature`
```bash
git push -u upstream/myfeature
```

## 5. Create a Merge Request

You can create a merge request from the list of merge requests.

1. On the left sidebar, select **Search or go to** and find your project.
2. Select **Code > Merge requests**.
3. In the upper-right corner, select **New merge request**.
4. Select a source and target branch and then **Compare branches and continue**.
5. Fill out the fields and select **Create merge request**.

### Get a code review

Open a merge request, assign it to to one or more
reviewers, and add the `Peer-Review` label
```bash
/assign @reviewer-1 @reviewer-2
/label ~"Workflow:: Peer-Review"
```

Reviewers will do a thorough code review, looking for
correctness, bugs, opportunities for improvement, documentation and comments,
and style.

Commit changes made in response to review comments to the same branch: 
```bash
git add README.md
git commit -m "Fixed typos in versioning section"
git push -u upstream/myfeature
```

Very small MRs are easy to review.  Very large MRs are very difficult to review.

### Squash commits

After a review, prepare your MR for merging by squashing your commits.

All commits left on your branch after a review should represent meaningful milestones or units of work. Use commits to add clarity to the development and review process.

Before merging a MR, squash the following kinds of commits:

- Fixes/review feedback
- Typos
- Merges and rebases
- Work in progress

Aim to have every commit in a MR compile and pass tests independently if you can, but it's not a requirement. In particular, `merge` commits must be removed, as they will not pass tests.

To squash your commits, perform an [interactive rebase](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History):

1. Check your git branch:
    ```bash
    git status
    ```

    The output should be similar to this:

    ```bash
    On branch myfeature
    Your branch is up to date with 'origin/myfeature'.
    ```

2. Start an interactive rebase using a specific commit hash, or count backwards from your last commit using `HEAD~<n>`, where `<n>` represents the number of commits to include in the rebase.

    ```bash
    git rebase -i HEAD~3
    ```

    The output should be similar to this:

    ```bash
    pick 2ebe926 Original commit
    pick 31f33e9 Address feedback
    pick b0315fe Second unit of work

    # Rebase 7c34fc9..b0315ff onto 7c34fc9 (3 commands)
    #
    # Commands:
    # p, pick <commit> = use commit
    # r, reword <commit> = use commit, but edit the commit message
    # e, edit <commit> = use commit, but stop for amending
    # s, squash <commit> = use commit, but meld into previous commit
    # f, fixup <commit> = like "squash", but discard this commit's log message

    ...

    ```

3. Use a command line text editor to change the word `pick` to `squash` for the commits you want to squash, then save your changes and continue the rebase:

    ```bash
    pick 2ebe926 Original commit
    squash 31f33e9 Address feedback
    pick b0315fe Second unit of work

    ...

    ```


    The output after saving changes should look similar to this:

    ```bash
    [detached HEAD 61fdded] Second unit of work
    Date: Thu Mar 5 19:01:32 2020 +0100
    2 files changed, 15 insertions(+), 1 deletion(-)

    ...

    Successfully rebased and updated refs/heads/main.
    ```

4. Force push your changes to your remote branch:

    ```bash
    git push --force
    ```

For mass automated fixups such as automated doc formatting, use one or more
commits for the changes to tooling and a final commit to apply the fixup en
masse. This makes reviews easier.

By squashing locally, you control the commit message(s) for your work, and can separate a large MR into logically separate changes.
For example: you have a merge request that is code complete and has 24 commits. You rebase this against the same merge base, simplifying the change to two commits. Each of those two commits represents a single logical change and each commit message summarizes what changes. Reviewers see that the set of changes are now understandable, and approve your MR.

## Merging a commit

Once you've received review and approval, your commits are squashed, your MR is ready for merging.

Merging happens automatically after both a Reviewer and Approver have approved the MR. If you haven't squashed your commits, they may ask you to do so before approving a MR.

## Reverting a commit

In case you wish to revert a commit, use the following instructions.

- Create a branch and sync it with upstream.
  ```bash
  # create a branch
  git checkout -b myrevert

  # sync the branch with upstream
  git fetch upstream
  git rebase upstream/main
  ```
- If the commit you wish to revert is a *merge commit*, use this command:
  ```bash
  # SHA is the hash of the merge commit you wish to revert
  git revert -m 1 <SHA>
  ```
  If it is a *single commit*, use this command:
  ```bash
  # SHA is the hash of the single commit you wish to revert
  git revert <SHA>
  ```

- This will create a new commit reverting the changes. Push this new commit to your remote.
  ```bash
  git push <your_remote_name> myrevert
  ```

- Finally, create a Merge Request using this branch.


---
Source Documentation: [Kubernetes Contributing](https://www.kubernetes.dev/docs/guide/github-workflow/) [github-workflow.md](https://github.com/kubernetes/community/blob/master/contributors/guide/github-workflow.md?plain=1)
