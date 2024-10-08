## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add omotes https://Project-OMOTES.github.io/omotes-helm

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions
of the packages. You can then run `helm search repo omotes` to see the charts and versions.

Update settings by editing the `values.yaml` file which can be obtained by:

    helm show values omotes/omotes-system > values.yaml

Workflow definitions can also be read from file, instead of copying into the `values.yaml` file, with the `--set-file` option.

To install the omotes-system chart:

    helm install -n <namespace> <release-name> omotes/omotes-system (--version <chart-version>) -f values.yaml --set-file workflowsDefinitionJson=workflow_config_nwn_9sept2024.json

To uninstall the chart:

    helm uninstall <release-name>
