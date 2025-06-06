#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

# APT_PACKAGES=(
    #"package-1"
    #"package-2"
# )

PIP_PACKAGES=(
    "sageattention"
    #"package-2"
)

NODES=(
	"https://github.com/ltdrdata/ComfyUI-Manager"
	"https://github.com/cubiq/ComfyUI_essentials"
	"https://github.com/ltdrdata/ComfyUI-Manager"
	"https://github.com/ltdrdata/ComfyUI-Impact-Pack"
	"https://github.com/rgthree/rgthree-comfy"
	"https://github.com/yuvraj108c/ComfyUI-Upscaler-Tensorrt"
	"https://github.com/WASasquatch/was-node-suite-comfyui"
	"https://github.com/kijai/ComfyUI-KJNodes"
	"https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
	"https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
	"https://github.com/Smirnov75/ComfyUI-mxToolkit"
	"https://github.com/facok/ComfyUI-HunyuanVideoMultiLora"
	"https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
	"https://github.com/kijai/ComfyUI-Florence2"
	"https://github.com/pollockjj/ComfyUI-MultiGPU"

)

# WORKFLOWS=(

# )

# CHECKPOINT_MODELS=(
#    "https://civitai.com/api/download/models/798204?type=Model&format=SafeTensor&size=full&fp=fp16"

# )

DIFFUSION_MODELS=(
 	"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-480P_fp8_e4m3fn.safetensors"
	"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-T2V-14B_fp8_e4m3fn.safetensors"

)

LORA_MODELS=(
	"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_14B_T2V_lora_rank32.safetensors"
	"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_14B_T2V_lora_rank32_v2.safetensors"
	"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_AccVid_I2V_480P_14B_lora_rank32_fp16.safetensors"
	"https://civitai.com/api/download/models/1805489"
	"https://civitai.com/api/download/models/1534254"
	"https://civitai.com/api/download/models/1534254"
	"https://civitai.com/api/download/models/1545040"
	"https://civitai.com/api/download/models/1612131"
	"https://civitai.com/api/download/models/1598828"
	"https://civitai.com/api/download/models/1525363"
	"https://civitai.com/api/download/models/1621698"
	"https://civitai.com/api/download/models/1475095"
	"https://civitai.com/api/download/models/1693883"
	"https://civitai.com/api/download/models/1630992"
	"https://civitai.com/api/download/models/1545362"
	"https://civitai.com/api/download/models/1803667"
	"https://civitai.com/api/download/models/1824672"
	"https://civitai.com/api/download/models/1713992"
	"https://civitai.com/api/download/models/1610465"
	"https://civitai.com/api/download/models/1639409"
	"https://civitai.com/api/download/models/1660695"
	"https://civitai.com/api/download/models/1513684"
	"https://civitai.com/api/download/models/1700298"
	"https://civitai.com/api/download/models/1602715"
	"https://civitai.com/api/download/models/1754775"
	"https://civitai.com/api/download/models/1516873"
)

VAE_MODELS=(
       "https://huggingface.co/Wan-AI/Wan2.1-I2V-14B-480P/resolve/main/Wan2.1_VAE.pth"

)

TEXT_ENCODERS=(
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-fp8_e4m3fn.safetensors"

)

# CONTROLNET_MODELS=(
# )

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
#    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
#        "${COMFYUI_DIR}/models/checkpoints" \
#        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/diffusion_models" \
        "${DIFFUSION_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/loras" \
        "${LORA_MODELS[@]}"
#    provisioning_get_files \
#        "${COMFYUI_DIR}/models/controlnet" \
#        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/text_encoders" \
        "${TEXT_ENCODERS[@]}"
    provisioning_print_end
}

# function provisioning_get_apt_packages() {
#    if [[ -n $APT_PACKAGES ]]; then
#            sudo $APT_INSTALL ${APT_PACKAGES[@]}
#    fi
# }

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$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" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $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" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$21e9132728834c65ec47b1c84cfbd08d" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $21e9132728834c65ec47b1c84cfbd08d" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $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 && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$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"
    elif 
        [[ -n $21e9132728834c65ec47b1c84cfbd08d && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$21e9132728834c65ec47b1c84cfbd08d"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
	provisioning_start
fi
