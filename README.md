## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

helm repo add omotes https://Project-OMOTES.github.io/omotes-helm

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions
of the packages. You can then run `helm search repo omotes` to see the charts.

To install the omotes-system chart (`my-omotes-system` can be changed to any alias):

    helm install my-omotes-system omotes/omotes-system

To uninstall the chart:

    helm delete my-omotes-system
