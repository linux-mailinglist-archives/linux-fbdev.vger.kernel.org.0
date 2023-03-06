Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E788E6ACBC2
	for <lists+linux-fbdev@lfdr.de>; Mon,  6 Mar 2023 18:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjCFR7f (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 6 Mar 2023 12:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjCFR7R (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 6 Mar 2023 12:59:17 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95B46C6BF;
        Mon,  6 Mar 2023 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678125524; x=1709661524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yt1JMNZEMwns8zPlPJmNRrMyNl9NvEHAApEp/Dn1mZs=;
  b=Rit5wBk8X/WRtoEjxXdVkp0NoHWPoz72y/wN5fIH+WfKZtJS0y8MXD2r
   /NRwkElNTYp4AyZSC/FggEN3QJa0N2mWqrJU2vCVxY42Y98Le/lmxX5yd
   3ebNi4x68Xo4V4jsPCO7WCBhQM3hd9MOPJc/E0PZIAhwHEyQcsJNYKgNe
   fQhkyUDyp5pP6+zjibpzPNAcQGPneLM+3k/3R7nQgSOHnahra+y1eRdAp
   8xzpfciuQ+AfY/v2uRbyyStIl+lK/8gdDTONLIPaQTuLPwPvtULOlOfjU
   n6Ts4NXyJSVPS2yCHUIq7bRp+rupaRvRDnMq6rh7r8pYAPrMcse39+UuY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398210868"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="398210868"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 09:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745160100"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="745160100"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 09:57:29 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZF5U-0000Vq-1r;
        Mon, 06 Mar 2023 17:57:28 +0000
Date:   Tue, 7 Mar 2023 01:57:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        paulus@samba.org, benh@kernel.crashing.org, linux@armlinux.org.uk,
        pjones@redhat.com, timur@kernel.org, adaplas@gmail.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
        thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
        spock@gentoo.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com, geert+renesas@glider.be,
        corbet@lwn.net
Cc:     oe-kbuild-all@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 07/99] fbdev/amifb: Parse option string with struct
 option_iter
Message-ID: <202303070108.gtLwdySM-lkp@intel.com>
References: <20230306160016.4459-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160016.4459-8-tzimmermann@suse.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.3-rc1 next-20230306]
[cannot apply to deller-parisc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230306160016.4459-8-tzimmermann%40suse.de
patch subject: [PATCH 07/99] fbdev/amifb: Parse option string with struct option_iter
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303070108.gtLwdySM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0b2c4af3b565e5ee830f7ed8e844d89237938f96
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
        git checkout 0b2c4af3b565e5ee830f7ed8e844d89237938f96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070108.gtLwdySM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/amifb.c: In function 'ami_decode_var':
   drivers/video/fbdev/amifb.c:1134:23: warning: variable 'vtotal' set but not used [-Wunused-but-set-variable]
    1134 |         u_int htotal, vtotal;
         |                       ^~~~~~
   drivers/video/fbdev/amifb.c:1134:15: warning: variable 'htotal' set but not used [-Wunused-but-set-variable]
    1134 |         u_int htotal, vtotal;
         |               ^~~~~~
   drivers/video/fbdev/amifb.c: In function 'ami_get_var_cursorinfo':
   drivers/video/fbdev/amifb.c:1855:19: warning: variable 'alloc' set but not used [-Wunused-but-set-variable]
    1855 |         int size, alloc;
         |                   ^~~~~
   drivers/video/fbdev/amifb.c: In function 'amifb_setup':
>> drivers/video/fbdev/amifb.c:2362:51: warning: passing argument 1 of 'amifb_setup_mcap' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2362 |                         amifb_setup_mcap(this_opt + 11);
         |                                          ~~~~~~~~~^~~~
   drivers/video/fbdev/amifb.c:2312:43: note: expected 'char *' but argument is of type 'const char *'
    2312 | static void __init amifb_setup_mcap(char *spec)
         |                                     ~~~~~~^~~~


vim +2362 drivers/video/fbdev/amifb.c

f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2348  
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2349  static int __init amifb_setup(const char *options)
^1da177e4c3f415 drivers/video/amifb.c       Linus Torvalds     2005-04-16  2350  {
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2351  	struct option_iter iter;
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2352  	const char *this_opt;
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2353  
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2354  	option_iter_init(&iter, options);
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2355  
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2356  	while (option_iter_next(&iter, this_opt)) {
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2357  		if (!strcmp(this_opt, "inverse")) {
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2358  			fb_invert_cmaps();
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2359  		} else if (!strcmp(this_opt, "ilbm"))
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2360  			amifb_ilbm = 1;
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2361  		else if (!strncmp(this_opt, "monitorcap:", 11))
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21 @2362  			amifb_setup_mcap(this_opt + 11);
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2363  		else if (!strncmp(this_opt, "fstart:", 7))
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2364  			min_fstrt = simple_strtoul(this_opt + 7, NULL, 0);
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2365  		else {
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2366  			static char mode_option_buf[256];
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2367  			int ret;
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2368  
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2369  			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", this_opt);
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2370  			if (WARN(ret < 0, "amifb: ignoring invalid option, ret=%d\n", ret))
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2371  				continue;
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2372  			if (WARN(ret >= sizeof(mode_option_buf), "amifb: option too long\n"))
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2373  				continue;
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2374  			mode_option = mode_option_buf;
d3d9f26ac65b035 drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2375  		}
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2376  	}
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2377  
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2378  	option_iter_release(&iter);
0b2c4af3b565e5e drivers/video/fbdev/amifb.c Thomas Zimmermann  2023-03-06  2379  
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2380  	if (min_fstrt < 48)
f1cbb17ac739932 drivers/video/amifb.c       Geert Uytterhoeven 2011-11-21  2381  		min_fstrt = 48;
^1da177e4c3f415 drivers/video/amifb.c       Linus Torvalds     2005-04-16  2382  
^1da177e4c3f415 drivers/video/amifb.c       Linus Torvalds     2005-04-16  2383  	return 0;
^1da177e4c3f415 drivers/video/amifb.c       Linus Torvalds     2005-04-16  2384  }
195197f408567b5 drivers/video/fbdev/amifb.c Randy Dunlap       2018-07-31  2385  #endif
^1da177e4c3f415 drivers/video/amifb.c       Linus Torvalds     2005-04-16  2386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
