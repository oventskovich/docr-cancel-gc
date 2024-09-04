# Cancel active Garbage Collection in DigitalOcean Container Registry GitHub Action

This GitHub Action cancels a currently active Garbage Collection in DigitalOcean Container Registry using the DigitalOcean CLI ([doctl](https://github.com/digitalocean/action-doctl)).

## Usage

Here's an example of how to use this action in your GitHub Actions workflow:

```yaml
- name: Install doctl
  uses: digitalocean/action-doctl@v2
  with:
    token: ${{ secrets.DIGITALOCEAN_API_KEY }}

- name: Cancel active Garbage Collection
  uses: oventskovich/docr-cancel-gc@v1
```

## License

This project is licensed under the MIT License.
