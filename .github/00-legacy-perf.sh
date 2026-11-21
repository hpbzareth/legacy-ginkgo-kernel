#!/system/bin/sh
# Legacy Ginkgo (MiTrinket Parity) Auto-Perf & System Tuning Service

# 1. ZRAM Memory Tuning (page-cluster 0 lowers swap latency by 80%)
if [ -e /sys/block/zram0/comp_algorithm ]; then
  echo "lz4" > /sys/block/zram0/comp_algorithm 2>/dev/null || echo "lzo" > /sys/block/zram0/comp_algorithm 2>/dev/null
fi
echo 0 > /proc/sys/vm/page-cluster 2>/dev/null
echo 100 > /proc/sys/vm/swappiness 2>/dev/null

# 2. GPU Adreno 610 Turbo 950MHz Max Performance
echo 0 > /sys/class/kgsl/kgsl-3d0/max_pwrlevel 2>/dev/null
echo 3 > /sys/class/kgsl/kgsl-3d0/min_pwrlevel 2>/dev/null
echo 0 > /sys/class/kgsl/kgsl-3d0/throttling 2>/dev/null

# 3. CPU Schedutil Ramp-Up & WALT
for pol in /sys/devices/system/cpu/cpufreq/policy*; do
  echo 500 > "$pol/schedutil/up_rate_limit_us" 2>/dev/null
  echo 20000 > "$pol/schedutil/down_rate_limit_us" 2>/dev/null
  echo 1000 > "$pol/schedutil/rate_limit_us" 2>/dev/null
done

# 4. Storage & eMMC Optimization (BFQ + 128KB Read-ahead)
for blk in /sys/block/mmcblk*; do
  echo bfq > "$blk/queue/scheduler" 2>/dev/null
  echo 128 > "$blk/queue/read_ahead_kb" 2>/dev/null
  echo 0 > "$blk/queue/add_random" 2>/dev/null
  echo 0 > "$blk/queue/iostats" 2>/dev/null
  echo 0 > "$blk/queue/rotational" 2>/dev/null
done

# 5. Virtual Memory Tuning
echo 5 > /proc/sys/vm/dirty_background_ratio 2>/dev/null
echo 15 > /proc/sys/vm/dirty_ratio 2>/dev/null
echo 100 > /proc/sys/vm/vfs_cache_pressure 2>/dev/null
echo 10 > /proc/sys/vm/stat_interval 2>/dev/null

# 6. TCP & Network Acceleration
echo 3 > /proc/sys/net/ipv4/tcp_fastopen 2>/dev/null
echo 0 > /proc/sys/net/ipv4/tcp_slow_start_after_idle 2>/dev/null

# 7. Power Efficiency
echo Y > /sys/module/workqueue/parameters/power_efficient 2>/dev/null
