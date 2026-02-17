# 🌲 YOLOv11 Flushing Ratio Workflow

This repository provides a complete workflow for extracting **flushing ratio metrics** from Norway spruce imagery using a custom-trained **YOLOv11 segmentation model**.

The pipeline integrates:

- Instance segmentation (Norway spruce crown & spruce buds)
- COCO RLE mask processing
- Mask post-processing
- Pixel-based phenological index computation

---

## 📘 Notebook

The full workflow is implemented in:

👉 **[YOLOv11_flushing_ratio_workflow.ipynb](YOLOv11_flushing_ratio_workfow.ipynb)**

The notebook can be executed in:

- Google Colab (recommended for GPU inference)
- Local Python environment

---

## 🎯 Objective

The workflow enables:

- Automated detection of:
  - `norway-spruce`
  - `spruce-bud`
- Extraction of segmentation masks
- Post-processing of masks (union, logical operations)
- Computation of flushing ratio and phenological metrics
- Export of structured results (CSV)

This enables scalable and reproducible phenological analysis.

---

## 🧠 Model

The workflow uses a custom-trained **YOLOv11 segmentation model**.

- Framework: Ultralytics YOLOv11
- Image size: 640×640
- Trained in: Google Colab
- Dataset: Roboflow (Spring Phenology – Norway Spruce)

Model weights are provided in this repository.

---

## ⚙️ Workflow Overview

1. Load trained YOLOv11 segmentation model  
2. Run batch inference on phenocam images  
3. Extract instance masks  
4. Convert masks to COCO RLE format  
5. Apply logical mask operations:
   - Foreground (FG)
   - Bud region (RB)
6. Compute pixel statistics
7. Export phenological metrics

---

## 📊 Output

The workflow produces:

- COCO-style segmentation JSON files
- Mask-based PNG cutouts
- CSV files containing:
  - Flushing ratio
  - Pixel counts
  - Derived phenological indices

---

## 📦 Requirements

Install required dependencies:

```bash
pip install ultralytics opencv-python numpy pycocotools orjson
