Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E3D7DBF
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2019 19:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388776AbfJOR32 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 15 Oct 2019 13:29:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:17513 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730734AbfJOR32 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 15 Oct 2019 13:29:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 10:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; 
   d="scan'208";a="208221415"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2019 10:29:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iKQdQ-000H71-0W; Wed, 16 Oct 2019 01:29:24 +0800
Date:   Wed, 16 Oct 2019 01:28:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     kbuild-all@lists.01.org, airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, b.zolnierkie@samsung.com, ajax@redhat.com,
        ville.syrjala@linux.intel.com, malat@debian.org,
        michel@daenzer.net, gregkh@linuxfoundation.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, corbet@lwn.net
Subject: Re: [PATCH v2 08/15] drm/fbconv: Add plane-state check and update
Message-ID: <201910160147.NR8eNv8Z%lkp@intel.com>
References: <20191014140416.28517-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014140416.28517-9-tzimmermann@suse.de>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.4-rc3 next-20191014]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/DRM-fbconv-helpers-for-converting-fbdev-drivers/20191015-152231
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_fbconv_helper.c:981:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> *dst @@    got n:2> *dst @@
>> drivers/gpu/drm/drm_fbconv_helper.c:981:39: sparse:    expected void [noderef] <asn:2> *dst
>> drivers/gpu/drm/drm_fbconv_helper.c:981:39: sparse:    got void *dst
   drivers/gpu/drm/drm_fbconv_helper.c:985:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> *dst @@    got n:2> *dst @@
   drivers/gpu/drm/drm_fbconv_helper.c:985:51: sparse:    expected void [noderef] <asn:2> *dst
   drivers/gpu/drm/drm_fbconv_helper.c:985:51: sparse:    got void *dst
   drivers/gpu/drm/drm_fbconv_helper.c:990:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2> *dst @@    got n:2> *dst @@
   drivers/gpu/drm/drm_fbconv_helper.c:990:51: sparse:    expected void [noderef] <asn:2> *dst
   drivers/gpu/drm/drm_fbconv_helper.c:990:51: sparse:    got void *dst
>> drivers/gpu/drm/drm_fbconv_helper.c:1291:21: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void *screen_base @@    got char [noderef] <asvoid *screen_base @@
>> drivers/gpu/drm/drm_fbconv_helper.c:1291:21: sparse:    expected void *screen_base
>> drivers/gpu/drm/drm_fbconv_helper.c:1291:21: sparse:    got char [noderef] <asn:2> *screen_base
>> drivers/gpu/drm/drm_fbconv_helper.c:1294:29: sparse: sparse: incorrect type in assignment (different address spaces) @@    expected void *screen_base @@    got void [noderef] <asvoid *screen_base @@
   drivers/gpu/drm/drm_fbconv_helper.c:1294:29: sparse:    expected void *screen_base
>> drivers/gpu/drm/drm_fbconv_helper.c:1294:29: sparse:    got void [noderef] <asn:2> *
>> drivers/gpu/drm/drm_fbconv_helper.c:1318:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> *addr @@    got n:2> *addr @@
>> drivers/gpu/drm/drm_fbconv_helper.c:1318:25: sparse:    expected void volatile [noderef] <asn:2> *addr
>> drivers/gpu/drm/drm_fbconv_helper.c:1318:25: sparse:    got void *screen_base
   drivers/gpu/drm/drm_fbconv_helper.c:1346:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> *addr @@    got n:2> *addr @@
   drivers/gpu/drm/drm_fbconv_helper.c:1346:38: sparse:    expected void volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/drm_fbconv_helper.c:1346:38: sparse:    got void *screen_base

vim +981 drivers/gpu/drm/drm_fbconv_helper.c

   956	
   957	/**
   958	 * drm_fbconv_blit_rect - copy an area of pixel data from a framebuffer
   959	 *	to the hardware buffer
   960	 * @dst:	the on-screen hardware buffer
   961	 * @vaddr:	the source buffer in kernel address space
   962	 * @fb:		the framebuffer of the source buffer
   963	 * @rect:	the area to copy
   964	 * Returns:
   965	 *	0 on success, or
   966	 *	a negative error code otherwise.
   967	 *
   968	 * This function copies the pixel data from a DRM framebuffer to a hardware
   969	 * buffer; doing necessary format conversion in the process. Not all
   970	 * combinations of source and destination formats are currently supported.
   971	 */
   972	int drm_fbconv_blit_rect(void *dst, void *vaddr, struct drm_framebuffer *fb,
   973				 struct drm_rect *rect)
   974	{
   975		struct drm_device *dev = fb->dev;
   976	
   977		if (!vaddr)
   978			return 0; /* no framebuffer set for plane; no error */
   979	
   980		if (dev->mode_config.preferred_depth == (fb->format->cpp[0] * 8))
 > 981			drm_fb_memcpy_dstclip(dst, vaddr, fb, rect);
   982	
   983		else if (fb->format->cpp[0] == 4 &&
   984			 dev->mode_config.preferred_depth == 16)
 > 985			drm_fb_xrgb8888_to_rgb565_dstclip(dst, fb->pitches[0],
   986							  vaddr, fb, rect, false);
   987	
   988		else if (fb->format->cpp[0] == 4 &&
   989			 dev->mode_config.preferred_depth == 24)
 > 990			drm_fb_xrgb8888_to_rgb888_dstclip(dst, fb->pitches[0],
   991							  vaddr, fb, rect);
   992	
   993		else {
   994			/* TODO: add the missing conversion */
   995			DRM_ERROR("fbconv: mismatching pixel formats\n");
   996			return -EINVAL;
   997		}
   998	
   999		return 0;
  1000	}
  1001	EXPORT_SYMBOL(drm_fbconv_blit_rect);
  1002	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
