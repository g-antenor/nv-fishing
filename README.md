# 🎣 Fishing

This fishing script allows players to engage in fishing activities with different fish types based on water depth. The deeper the water, the rarer and more valuable the fish that can be caught. In addition to catching fish, there is a chance to find a treasure chest while fishing, which can contain rare items or bonuses. The script is designed to offer variety and excitement, with different fishing locations and conditions affecting the type and quantity of catches. It encourages exploration and rewards players with valuable items.

<br>

## ⚙️ Dependências

Script developed for `QBCore`, compatible with some `OX` resources. 
Check the compatible dependencies below:
- **Dependencies**:
  - [`ox_lib`](https://github.com/overextended/ox_lib)
  - [`bl_ui`](https://github.com/Byte-Labs-Studio/bl_ui)
  - [`qb-inventory`](https://github.com/qbcore-framework/qb-inventory) or [`ox_inventory`](https://github.com/overextended/ox_inventory)

<br>
<br>

>If you want to support, you can buy me a coffee: </br>
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/D1D81650V6)


<br>
<br>

## 🚀 Instalação

Follow the steps below to install and configure the script:

1. Clone the repository:
   ```bash
   git clone https://github.com/g-antenor/nv-fishing.git
   ```
2. Add the script to your `server.cfg`:
    ```bash
    ensure nv-fishing
    ```
3. In the `installation` folder, you will find item resources for running the script:
    - **ox_inventory**:
        - **Items**: Copy all items from `installation/ox_inventory` and paste them into `ox_inventory/data/items`.
        - **Images**: Copy all images from `installation/images` and paste them into `ox_inventory/web/images`.

    - **qb-inventory**:
        - **Items**: Copy all items from `installation/ox_inventory` and paste them into `qb-core/shared/items`.
        - **Images**: Copy all images from `installation/images` and paste them into `qb-inventory/html/images`.
<br>
4. Modify `config.lua` according to your needs, then start the server.
