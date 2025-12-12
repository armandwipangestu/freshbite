## Git Flow

### Initialize

Start using git-flow by initializing it inside an existing git repository

> **NOTE**: Before running this command, create a new branch for developing the application
>
> ```bash
> git branch development
> ```

```bash
git flow init
```

Now choose the `main` branch as the production release and `development` branch as the development release

![Git Flow Init](assets/git-flow-init.png)

### Creating new feature

If you want to develop new feature for example `payment-gateway` you can create with git flow with this command

```bash
git flow feature start payment-gateway
```

![Git Flow Feature Start](assets/git-flow-feature-start.png)

After creating new feature you can start develop the feature

### Finish the feature

If your feature has been develop and finish, now you can merge the branch feature with the development branch with this command

```bash
git flow feature finish payment-gateway
```

![Git Flow Feature Finish](assets/git-flow-feature-finish.png)

### Create a new release

Everytime you finish the feature you can create a new release based on that code with this command

> **NOTE**: The `v1.1.0` is the release name

```bash
git flow release start v1.1.0
```

### Finish the release

The release has been created, now you can finish the release with this command

```bash
git flow release finish 'v1.1.0'
```

You can add release message for the feature you have been develop, for example `Release Payment Gateway Feature`

![Git Flow Release Finish](assets/git-flow-release-finish.png)

![Git Flow Release Finish 2](assets/git-flow-release-finish-2.png)

Now you can push the local branch repository to the remote repository (`development` and `main` branch)

But the push will not be create a tag and release on remote repository, to create that you must be push the version tag on local repository using this command

```bash
git push origin v1.1.0
```

![Git Flow Release Tag](assets/git-flow-release-tag.png)
