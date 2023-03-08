Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243EA6B0516
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 11:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjCHKzM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 8 Mar 2023 05:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjCHKyu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 8 Mar 2023 05:54:50 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF54B855F;
        Wed,  8 Mar 2023 02:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678272887; x=1709808887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=66H61N4kHRmXfvCBrz0bSfAwBEeowyIs0IrXDG69E8Y=;
  b=OXOHF10Cq/scvFirRcEOPcc4dbrC3OtHG1kc5wsX/0b2p4h+AGtAvhsN
   tbhqpVyXop1bkLa143OWKzB3PvwSPN9xSJl2GfNbTDMr7/zexlBl4H2n5
   spOBMlcss62V/JEbm3buxd/p9guYCfoRHuzalN7cR3UOnnZusM2Q8MCXp
   13L6X3nDIfwGyCQfLR6awKHg3TZudApqk/RqTR2wFr+34ltN8iQMHLvQY
   SO9Ex8FGLfiSpB8Bt4EjcaEBQMLvGsEvWg8FFguBYrr/hU+el7JShzf8n
   CLqvYdTqR0ta6mRcdZ1hIVg9zNL6+3nyClExewxsb1SjDjUUmDgwyc4kW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363759655"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="363759655"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 02:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800713009"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="800713009"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 02:54:44 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZrRT-00025R-0h;
        Wed, 08 Mar 2023 10:54:43 +0000
Date:   Wed, 8 Mar 2023 18:54:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Takashi Iwai <tiwai@suse.de>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
        Miko Larsson <mikoxyzzz@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Patrik Jakobsson <pjakobsson@suse.de>
Subject: Re: [PATCH] fbdev: Fix incorrect page mapping clearance at
 fb_deferred_io_release()
Message-ID: <202303081843.yyoyPjaN-lkp@intel.com>
References: <20230308063628.15233-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308063628.15233-1-tiwai@suse.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc1 next-20230308]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/fbdev-Fix-incorrect-page-mapping-clearance-at-fb_deferred_io_release/20230308-143749
patch link:    https://lore.kernel.org/r/20230308063628.15233-1-tiwai%40suse.de
patch subject: [PATCH] fbdev: Fix incorrect page mapping clearance at fb_deferred_io_release()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303081843.yyoyPjaN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fe94468e5ddd91231f1624559f861fb8110163c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/fbdev-Fix-incorrect-page-mapping-clearance-at-fb_deferred_io_release/20230308-143749
        git checkout fe94468e5ddd91231f1624559f861fb8110163c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/video/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081843.yyoyPjaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_release_internal':
>> drivers/video/fbdev/core/fb_defio.c:317:32: warning: unused variable 'fbdefio' [-Wunused-variable]
     317 |         struct fb_deferred_io *fbdefio = info->fbdefio;
         |                                ^~~~~~~


vim +/fbdefio +317 drivers/video/fbdev/core/fb_defio.c

0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  314  
fe94468e5ddd912 drivers/video/fbdev/core/fb_defio.c Takashi Iwai   2023-03-08  315  static void fb_deferred_io_release_internal(struct fb_info *info)
60b59beafba875a drivers/video/fb_defio.c            Jaya Kumar     2007-05-08  316  {
60b59beafba875a drivers/video/fb_defio.c            Jaya Kumar     2007-05-08 @317  	struct fb_deferred_io *fbdefio = info->fbdefio;
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  318  	struct page *page;
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  319  	int i;
60b59beafba875a drivers/video/fb_defio.c            Jaya Kumar     2007-05-08  320  
181b74ef794e198 drivers/video/fb_defio.c            Tejun Heo      2011-06-15  321  	cancel_delayed_work_sync(&info->deferred_work);
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  322  
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  323  	/* clear out the mapping that we setup */
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  324  	for (i = 0 ; i < info->fix.smem_len; i += PAGE_SIZE) {
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  325  		page = fb_deferred_io_page(info, i);
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  326  		page->mapping = NULL;
0b78f8bcf4951af drivers/video/fbdev/core/fb_defio.c Matthew Wilcox 2021-06-01  327  	}
3efc61d95259956 drivers/video/fbdev/core/fb_defio.c Takashi Iwai   2023-01-29  328  }
fe94468e5ddd912 drivers/video/fbdev/core/fb_defio.c Takashi Iwai   2023-03-08  329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
