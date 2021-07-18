# Datanalitica

Social Networks data analysis utilities and tools, starting with Twitter.

To load this package open a Playground in GToolkit and execute:

```smalltalk
	"I load the configuration of this package using a external Gitea repository." 	"While more Git independient providers are implemented in Monticello, I will use Iceberg	to download the repository and load it from a local directory"		| location localRepo repoName packageName |		"Sometimes repoName and packageName are different, following Pharo's conventions.	For example the repoName can be MyPackage, while packageName can be My-Package"	repoName := 'Datanalitica'.	packageName := 'Datanalitica'.		"Local and remote repo definition"	location := FileLocator localDirectory / 'iceberg' / 'Offray' / repoName.	location exists ifFalse: [		(IceRepositoryCreator new 			location: location;			remote: (IceGitRemote url: 'https://code.tupale.co/Offray/', repoName, '.git');			createRepository)		register	].	"Package loading"	localRepo := 'gitlocal://', location fullName.	Metacello new		repository: localRepo;		baseline: repoName;		load.	spec baseline: repoName with: [ spec repository:  localRepo ].	spec package: packageName with: [ spec repository:  localRepo ].
```
