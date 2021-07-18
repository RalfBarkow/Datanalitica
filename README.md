# Datanalitica

Social Networks data analysis utilities and tools, starting with Twitter.

To load this package open a Playground in GToolkit and execute:

```smalltalk
  "I load the configuration of this package using a external Gitea repository."   "While more Git independient providers are implemented in Monticello, I will use Iceberg  to download the repository and load it from a local directory"	  | location localRepo repoName |    repoName := 'Datanalitica'.    "Local and remote repo definition"  location := FileLocator localDirectory / 'iceberg' / 'Offray' / repoName.  location exists ifFalse: [      (IceRepositoryCreator new           location: location;          remote: (IceGitRemote url: 'https://code.tupale.co/Offray/', repoName, '.git');          createRepository)      register  ].  "Package loading"  localRepo := 'gitlocal://', location fullName.  Metacello new      repository: localRepo;      baseline: repoName;      load.
```
