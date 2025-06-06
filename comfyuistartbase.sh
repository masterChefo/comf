#!/bin/bash

source /venv/main/bin/activate

NODES=(
	"https://github.com/ltdrdata/ComfyUI-Manager"
	"https://github.com/ltdrdata/ComfyUI-Impact-Pack
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
	"https://github.com/thu-ml/SageAttention"
)

DIFFUSION_MODELS=(
     "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-480P_fp8_e4m3fn.safetensors"
     "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-T2V-14B_fp8_e4m3fn.safetensors"
#     "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
#     "https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
)

LORA_MODELS=(
     "https://civitai.com/api/download/models/16576"
     "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_14B_T2V_lora_rank32.safetensors"
	"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_14B_T2V_lora_rank32_v2.safetensors"
"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_AccVid_I2V_480P_14B_lora_rank32_fp16.safetensors"
	"https://civitai.com/api/download/models/1805489"
"https://civitai.com/api/download/models/1534254?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1534254?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1545040?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1612131?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1598828?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1525363?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1621698?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1475095?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1693883?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1630992?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1545362?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1803667?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1824672?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1713992?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1610465?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1639409?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1660695?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1513684?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1700298?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1602715?token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1754775? token=21e9132728834c65ec47b1c84cfbd08d"
"https://civitai.com/api/download/models/1516873? token=21e9132728834c65ec47b1c84cfbd08d"
)

VAE_MODELS=(
       "https://huggingface.co/Wan-AI/Wan2.1-I2V-14B-480P/resolve/main/Wan2.1_VAE.pth"
#     "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
#     "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

TEXT_ENCODERS=(
     "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-fp8_e4m3fn.safetensors"
#     "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
#     "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CHECKPOINTS_MODELS=(
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
#     "https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
#     "https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    DISK_GB_AVAILABLE=$(($(df --output=avail -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_USED=$(($(df --output=used -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_ALLOCATED=$(($DISK_GB_AVAILABLE + $DISK_GB_USED))
    provisioning_print_header
    provisioning_get_nodes
    provisioning_install_python_packages
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/diffusion_models" \
        "${DIFFUSION_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/loras" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/text_encoders" \
        "${TEXT_ENCODERS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/checkpoints" \
        "${CHECKPOINTS_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function provisioning_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    if [[ $DISK_GB_ALLOCATED -ge $DISK_GB_REQUIRED ]]; then
        arr=("$@")
    else
        printf "WARNING: Low disk space allocation - Only the first model will be downloaded!\n"
        arr=("$1")
    fi
    
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

provisioning_start