Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6C678C8F1
	for <lists+linux-fbdev@lfdr.de>; Tue, 29 Aug 2023 17:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbjH2P4u (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 29 Aug 2023 11:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237324AbjH2P4Z (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 29 Aug 2023 11:56:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D313212D;
        Tue, 29 Aug 2023 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693324582; x=1724860582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Net98/tBKWwHvEeymx3Z6uXP6ZPeuR/3kE/rCN6ir8=;
  b=EqA5l2/KfH2xFHJ4VnyXu7OdvZMwS1FTN7GxcICZ1PArXgAjTlDXexy5
   vEEbv6Bq7My4aD7tzHcDyKNpOn30b0b3b1I2BlETihfIcstiu0Lx23V3c
   cp+Y/2WvTi2JwgLUaiGJiNi0OWv+JFI+nq/HxN4VXykXAgW5/KSr3eIGD
   xxGcVMUvgQ3k1OaLRL5kBzXU/82+WGkBgq700oEWuH/R2qod+abf6jUs6
   NVMS8FByhDeA+/I4hD8GH31PH/GBzuY4npBrFIyqu0FnjyNXDo8nQmJs5
   JnEHYiMubpa9i1SgNOQU0sR5SqXQCG6dd6RzIsYg91BolMH3p7qDOt/EO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375365762"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="375365762"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 08:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="741870843"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="741870843"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 08:56:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qb14k-0008sN-2f;
        Tue, 29 Aug 2023 15:56:18 +0000
Date:   Tue, 29 Aug 2023 23:55:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/7] fbdev/core: Move logo functions into separate source
 file
Message-ID: <202308292302.bkYBkvrg-lkp@intel.com>
References: <20230829142109.4521-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829142109.4521-5-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20230829]
[cannot apply to linus/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-au1200fb-Do-not-display-boot-up-logo/20230829-222419
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230829142109.4521-5-tzimmermann%40suse.de
patch subject: [PATCH 4/7] fbdev/core: Move logo functions into separate source file
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308292302.bkYBkvrg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292302.bkYBkvrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308292302.bkYBkvrg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/core/fb_logo.c:433:5: warning: no previous prototype for 'fb_prepare_logo' [-Wmissing-prototypes]
     433 | int fb_prepare_logo(struct fb_info *info, int rotate)
         |     ^~~~~~~~~~~~~~~
>> drivers/video/fbdev/core/fb_logo.c:506:5: warning: no previous prototype for 'fb_show_logo' [-Wmissing-prototypes]
     506 | int fb_show_logo(struct fb_info *info, int rotate)
         |     ^~~~~~~~~~~~


vim +/fb_prepare_logo +433 drivers/video/fbdev/core/fb_logo.c

   432	
 > 433	int fb_prepare_logo(struct fb_info *info, int rotate)
   434	{
   435		int depth = fb_get_color_depth(&info->var, &info->fix);
   436		unsigned int yres;
   437		int height;
   438	
   439		memset(&fb_logo, 0, sizeof(struct logo_data));
   440	
   441		if (info->flags & FBINFO_MISC_TILEBLITTING ||
   442		    info->fbops->owner || !fb_logo_count)
   443			return 0;
   444	
   445		if (info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
   446			depth = info->var.blue.length;
   447			if (info->var.red.length < depth)
   448				depth = info->var.red.length;
   449			if (info->var.green.length < depth)
   450				depth = info->var.green.length;
   451		}
   452	
   453		if (info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR && depth > 4) {
   454			/* assume console colormap */
   455			depth = 4;
   456		}
   457	
   458		/* Return if no suitable logo was found */
   459		fb_logo.logo = fb_find_logo(depth);
   460	
   461		if (!fb_logo.logo)
   462			return 0;
   463	
   464		if (rotate == FB_ROTATE_UR || rotate == FB_ROTATE_UD)
   465			yres = info->var.yres;
   466		else
   467			yres = info->var.xres;
   468	
   469		if (fb_logo.logo->height > yres) {
   470			fb_logo.logo = NULL;
   471			return 0;
   472		}
   473	
   474		/* What depth we asked for might be different from what we get */
   475		if (fb_logo.logo->type == LINUX_LOGO_CLUT224)
   476			fb_logo.depth = 8;
   477		else if (fb_logo.logo->type == LINUX_LOGO_VGA16)
   478			fb_logo.depth = 4;
   479		else
   480			fb_logo.depth = 1;
   481	
   482	
   483		if (fb_logo.depth > 4 && depth > 4) {
   484			switch (info->fix.visual) {
   485			case FB_VISUAL_TRUECOLOR:
   486				fb_logo.needs_truepalette = 1;
   487				break;
   488			case FB_VISUAL_DIRECTCOLOR:
   489				fb_logo.needs_directpalette = 1;
   490				fb_logo.needs_cmapreset = 1;
   491				break;
   492			case FB_VISUAL_PSEUDOCOLOR:
   493				fb_logo.needs_cmapreset = 1;
   494				break;
   495			}
   496		}
   497	
   498		height = fb_logo.logo->height;
   499		if (fb_center_logo)
   500			height += (yres - fb_logo.logo->height) / 2;
   501	
   502		return fb_prepare_extra_logos(info, height, yres);
   503	}
   504	EXPORT_SYMBOL(fb_prepare_logo);
   505	
 > 506	int fb_show_logo(struct fb_info *info, int rotate)
   507	{
   508		unsigned int count;
   509		int y;
   510	
   511		if (!fb_logo_count)
   512			return 0;
   513	
   514		count = fb_logo_count < 0 ? num_online_cpus() : fb_logo_count;
   515		y = fb_show_logo_line(info, rotate, fb_logo.logo, 0, count);
   516		y = fb_show_extra_logos(info, y, rotate);
   517	
   518		return y;
   519	}
   520	EXPORT_SYMBOL(fb_show_logo);
   521	#else
   522	int fb_prepare_logo(struct fb_info *info, int rotate)
   523	{
   524		return 0;
   525	}
   526	EXPORT_SYMBOL(fb_prepare_logo);
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
