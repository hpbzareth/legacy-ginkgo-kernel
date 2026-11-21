# 🚀 Legacy Ginkgo Kernel (Linux 4.14.117) — Pure Performance

Mã nguồn và hệ thống tự động biên dịch (CI/CD) cho **Xiaomi Redmi Note 8 / 8T** (`ginkgo` / `willow`) dựa trên nền tảng chính thức **Xiaomi Base 4.14.117** (`MiCode/Xiaomi_Kernel_OpenSource` - nhánh `ginkgo-q-oss`).

Được thiết kế theo tiêu chí **"Clean Tree & Maximum Performance"**: không can thiệp nhúng code root vào cây kernel, tương thích hoàn hảo 100% với **FolkPatch / APatch** và tối ưu hóa tối đa cho các bản ROM **Android 10** (LineageOS 17.1, MIUI 12, crDroid 6.x, Pixel Experience 10).

---

## ⚡ Các Điểm Tối Ưu Nổi Bật (Highlights)

1. **Clean Tree — APatch / FolkPatch Native:**
   - Cây mã nguồn sạch 100%, không bị sửa đổi VFS/syscalls như KernelSU/SukiSU.
   - Sẵn sàng root ngay qua **APatch / FolkPatch** bằng cách vá trực tiếp `boot.img` chỉ trong 3 giây.
2. **GPU Adreno 610 Turbo 950MHz L0:**
   - Mở khóa xung nhịp tối đa Level 0 (950MHz) qua `kgsl-3d0`.
   - Vô hiệu hóa bóp xung nhiệt độ ép buộc (`throttling = 0`).
3. **Điều phối CPU Schedutil 500us:**
   - `up_rate_limit_us = 500`: CPU lập tức nhảy lên mức xung cao nhất trong vòng 0.5ms ngay khi ngón tay chạm màn hình.
   - `down_rate_limit_us = 20000`: Giữ xung cao thêm 20ms giúp animation vuốt mượt mà không bị khựng.
4. **Màn hình Frame-Perfect 300Hz Timer (`CONFIG_HZ=300`):**
   - Tần số timer chia hết hoàn hảo cho 60 FPS (5 ticks/frame) và 30 FPS, triệt tiêu hiện tượng micro-stutter.
5. **Storage I/O Scheduler BFQ & Read-ahead 128KB:**
   - Ưu tiên I/O cho ứng dụng đang hiển thị trên màn hình, tối ưu theo khối đọc của chip eMMC 5.1.
6. **ZRAM Siêu Tốc (LZO-RLE):**
   - Nén swap RAM với thuật toán LZO Run-Length Encoded siêu nhẹ, giảm tải chu kỳ CPU.
7. **Debloat Debugging:**
   - Tắt toàn bộ logging rác: `FTRACE`, `DEBUG_KMEMLEAK`, `SLUB_DEBUG`, `SCHED_DEBUG` để giải phóng RAM và giảm overhead CPU.

---

## 🛠️ Hướng Dẫn Biên Dịch (GitHub Actions)

1. Truy cập tab **Actions** trên repository này.
2. Chọn workflow **Build Legacy Ginkgo 4.14.117 Kernel (Ultra-Optimized)**.
3. Bấm **Run workflow**:
   - **Target Device:** `ginkgo`
   - **Clang Compiler:** `proton-clang` (Khuyến nghị)
4. Đợi khoảng 10-15 phút, hệ thống sẽ tự động đóng gói file zip **AnyKernel3** flashable và xuất bản trực tiếp lên mục **Releases**.

---

## 📥 Hướng Dẫn Cài Đặt (Flashing)

1. Khởi động điện thoại vào **OrangeFox Recovery** (hoặc TWRP).
2. Chọn file zip `Legacy-Ginkgo-4.14.117-PurePerf-xxxx.zip` và kéo thanh trượt để Flash.
3. Khởi động lại hệ thống (**Reboot System**).

### 🛡️ Cách Root Bằng FolkPatch / APatch:
1. Cài app **FolkPatch** (hoặc **APatch**) trên điện thoại.
2. Chọn **Patch Boot Image** ➔ Chọn file `boot.img` gốc của ROM (hoặc dump từ máy).
3. Nhập SuperKey và bấm Patch.
4. Flash file `boot_patched.img` vào phân vùng Boot qua Recovery hoặc Fastboot là xong!

---

## 📜 Bản Quyền & Tác Quyền
- Dựa trên [Xiaomi_Kernel_OpenSource](https://github.com/MiCode/Xiaomi_Kernel_OpenSource) (nhánh `ginkgo-q-oss`).
- Đóng gói AnyKernel3 bởi [osm0sis](https://github.com/osm0sis/AnyKernel3) & [FlopKernel-Series](https://github.com/FlopKernel-Series).
- Bản tùy biến & tối ưu hóa thực hiện bởi **Zareth**.
