Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8F41CA0B2
	for <lists+linux-fbdev@lfdr.de>; Fri,  8 May 2020 04:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgEHCUj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 May 2020 22:20:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:50333 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726792AbgEHCUj (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 7 May 2020 22:20:39 -0400
IronPort-SDR: 7viWeSEp5vt3mAEDfuEWeWPoMUl36JPLEep+k0BjgImBA9BFDN0PSutLuN5qE+brSoa9pIv6vW
 eIAZAiqth0TA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 19:20:39 -0700
IronPort-SDR: LDkFWHHBbP2bfYOq5UuE96zwayAebjocsUKx5BCyycJvVmMv5cB87eIE0oLfZMgPI6TRfYCva8
 SVceKsZIB1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="249487077"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 May 2020 19:20:37 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jWscu-000Bvx-MP; Fri, 08 May 2020 10:20:36 +0800
Date:   Fri, 8 May 2020 10:20:09 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v11 14/14] drm/i915/psr: Use new DP VSC SDP compute
 routine on PSR
Message-ID: <202005081038.ctmtcNFX%lkp@intel.com>
References: <20200507132706.2058969-15-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507132706.2058969-15-gwan-gyeong.mun@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Gwan-gyeong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next next-20200507]
[cannot apply to tegra-drm/drm/tegra/for-next linus/master v5.7-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Gwan-gyeong-Mun/In-order-to-readout-DP-SDPs-refactors-the-handling-of-DP-SDPs/20200508-034404
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

New smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:727 intel_psr_compute_config() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1564 intel_psr_short_pulse() error: uninitialized symbol 'error_status'.
drivers/gpu/drm/i915/display/intel_psr.c:1569 intel_psr_short_pulse() error: uninitialized symbol 'error_status'.

vim +727 drivers/gpu/drm/i915/display/intel_psr.c

   711	
   712	void intel_psr_compute_config(struct intel_dp *intel_dp,
   713				      struct intel_crtc_state *crtc_state)
   714	{
   715		struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
   716		struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
   717		const struct drm_display_mode *adjusted_mode =
   718			&crtc_state->hw.adjusted_mode;
   719		int psr_setup_time;
   720	
   721		if (!CAN_PSR(dev_priv))
   722			return;
   723	
   724		if (intel_dp != dev_priv->psr.dp)
   725			return;
   726	
 > 727		 if (!psr_global_enabled(dev_priv))
   728			return;
   729		/*
   730		 * HSW spec explicitly says PSR is tied to port A.
   731		 * BDW+ platforms have a instance of PSR registers per transcoder but
   732		 * for now it only supports one instance of PSR, so lets keep it
   733		 * hardcoded to PORT_A
   734		 */
   735		if (dig_port->base.port != PORT_A) {
   736			drm_dbg_kms(&dev_priv->drm,
   737				    "PSR condition failed: Port not supported\n");
   738			return;
   739		}
   740	
   741		if (dev_priv->psr.sink_not_reliable) {
   742			drm_dbg_kms(&dev_priv->drm,
   743				    "PSR sink implementation is not reliable\n");
   744			return;
   745		}
   746	
   747		if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
   748			drm_dbg_kms(&dev_priv->drm,
   749				    "PSR condition failed: Interlaced mode enabled\n");
   750			return;
   751		}
   752	
   753		psr_setup_time = drm_dp_psr_setup_time(intel_dp->psr_dpcd);
   754		if (psr_setup_time < 0) {
   755			drm_dbg_kms(&dev_priv->drm,
   756				    "PSR condition failed: Invalid PSR setup time (0x%02x)\n",
   757				    intel_dp->psr_dpcd[1]);
   758			return;
   759		}
   760	
   761		if (intel_usecs_to_scanlines(adjusted_mode, psr_setup_time) >
   762		    adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vdisplay - 1) {
   763			drm_dbg_kms(&dev_priv->drm,
   764				    "PSR condition failed: PSR setup time (%d us) too long\n",
   765				    psr_setup_time);
   766			return;
   767		}
   768	
   769		crtc_state->has_psr = true;
   770		crtc_state->has_psr2 = intel_psr2_config_valid(intel_dp, crtc_state);
   771		crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
   772	}
   773	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
