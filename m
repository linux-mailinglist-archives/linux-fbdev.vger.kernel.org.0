Return-Path: <linux-fbdev+bounces-3223-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 671CC992C5E
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2024 14:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3EFDB2464C
	for <lists+linux-fbdev@lfdr.de>; Mon,  7 Oct 2024 12:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34781D26EE;
	Mon,  7 Oct 2024 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isXsbA0I"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7824A1D14FA
	for <linux-fbdev@vger.kernel.org>; Mon,  7 Oct 2024 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728305334; cv=none; b=Cr0CT9zzQlSvDEXXrJjtcpIpUs0Kq6NQTVsGUKvgA6RGsAz2cPiwhrBW/g16KqxbAnQwxW5/uLnLbVFUi8HocQ12wKIKMYjAzY2C6Op7PfS/5gegQNeN9akBUfjrTgh08uajNGdc2sJDLUtmZDlmljBI2aM2EXP9F5KOKVnnQfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728305334; c=relaxed/simple;
	bh=ysVTXNU2ucl9SaVTZ5Lr60rELrWrYmvaQrJsrccxSBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NToxbCrWrGO5SC+wPrZlJQSdZXcIEo9foLvVlBgvcf5aSFPYAjNHui72ccsNF3ZalVfTDBLgyzxe8DdSG8oi59TdHfrzv8XWdNmzzfQogkKnC6VeresEvq21fGhtHNi139Ha9JNYkCoTZ+Ytm4yAKSbzNl6TDC4UFpujHMXFSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isXsbA0I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728305333; x=1759841333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ysVTXNU2ucl9SaVTZ5Lr60rELrWrYmvaQrJsrccxSBU=;
  b=isXsbA0IzSxVPap9R/qWim2jUUs7XgnxCv/tFnzz+jC2cC3VUAkcChsj
   DcEXUDyXkNkWZsFDZw9kBX+4fPszRkQj4ZTzA4Rtgqm6vgt4oE/n7hv54
   h8sijA7XZybdYj6XSMMMX2idV2uGJlCDbIVf3V7AYNRKDDJsa0WYzInjf
   7j09I4NXNI8WHMyN/BAxWb1VdroeEPh0XGVYg9wiT+7XjuOpHED4VYqyT
   cjnHTq3kZQWPUflmrefDc1Ebas4VR9gywpu3/53pKoB6u/HRJfDRpMDyk
   nYpBHJqfPzQ5CG1Dh0Z5I6etvvTC9UhGh2joJxv2iQKlkwJkjTI09FE3Q
   w==;
X-CSE-ConnectionGUID: yrwyR/+AQriAK3DW/fy0qw==
X-CSE-MsgGUID: 0I2Lfv3HR6mASY6dMAk5zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31152291"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31152291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 05:48:53 -0700
X-CSE-ConnectionGUID: PCsGns7aSCa0E0+nXwQVvg==
X-CSE-MsgGUID: OfEO/U3ZRS2nSXhbTggRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80055133"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Oct 2024 05:48:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxnAO-0004zB-0r;
	Mon, 07 Oct 2024 12:48:48 +0000
Date: Mon, 7 Oct 2024 20:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
	linux-fbdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	thomas.zimmermann@suse.de,
	Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: Re: [PATCH v2] fbdev: sstfb: Make CONFIG_FB_DEVICE optional
Message-ID: <202410072022.oRqUf7DT-lkp@intel.com>
References: <20241004152429.4329-1-gonzalo.silvalde@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004152429.4329-1-gonzalo.silvalde@gmail.com>

Hi Gonzalo,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gonzalo-Silvalde-Blanco/fbdev-sstfb-Make-CONFIG_FB_DEVICE-optional/20241004-232658
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241004152429.4329-1-gonzalo.silvalde%40gmail.com
patch subject: [PATCH v2] fbdev: sstfb: Make CONFIG_FB_DEVICE optional
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072022.oRqUf7DT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072022.oRqUf7DT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410072022.oRqUf7DT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/sstfb.c: In function 'sstfb_probe':
>> drivers/video/fbdev/sstfb.c:1439:2: error: invalid preprocessing directive #fdef; did you mean #ifdef?
    1439 | #fdef CONFIG_FB_DEVICE
         |  ^~~~
         |  ifdef
   drivers/video/fbdev/sstfb.c:1442:2: error: #endif without #if
    1442 | #endif
         |  ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1439 drivers/video/fbdev/sstfb.c

  1320	
  1321	static int sstfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  1322	{
  1323		struct fb_info *info;
  1324		struct fb_fix_screeninfo *fix;
  1325		struct sstfb_par *par;
  1326		struct sst_spec *spec;
  1327		int err;
  1328	
  1329		err = aperture_remove_conflicting_pci_devices(pdev, "sstfb");
  1330		if (err)
  1331			return err;
  1332	
  1333		/* Enable device in PCI config. */
  1334		if ((err=pci_enable_device(pdev))) {
  1335			printk(KERN_ERR "cannot enable device\n");
  1336			return err;
  1337		}
  1338	
  1339		/* Allocate the fb and par structures.  */
  1340		info = framebuffer_alloc(sizeof(struct sstfb_par), &pdev->dev);
  1341		if (!info)
  1342			return -ENOMEM;
  1343	
  1344		pci_set_drvdata(pdev, info);
  1345	
  1346		par  = info->par;
  1347		fix  = &info->fix;
  1348	
  1349		par->type = id->driver_data;
  1350		spec = &voodoo_spec[par->type];
  1351		f_ddprintk("found device : %s\n", spec->name);
  1352	
  1353		par->dev = pdev;
  1354		par->revision = pdev->revision;
  1355	
  1356		fix->mmio_start = pci_resource_start(pdev,0);
  1357		fix->mmio_len	= 0x400000;
  1358		fix->smem_start = fix->mmio_start + 0x400000;
  1359	
  1360		if (!request_mem_region(fix->mmio_start, fix->mmio_len, "sstfb MMIO")) {
  1361			printk(KERN_ERR "sstfb: cannot reserve mmio memory\n");
  1362			goto fail_mmio_mem;
  1363		}
  1364	
  1365		if (!request_mem_region(fix->smem_start, 0x400000,"sstfb FB")) {
  1366			printk(KERN_ERR "sstfb: cannot reserve fb memory\n");
  1367			goto fail_fb_mem;
  1368		}
  1369	
  1370		par->mmio_vbase = ioremap(fix->mmio_start,
  1371						fix->mmio_len);
  1372		if (!par->mmio_vbase) {
  1373			printk(KERN_ERR "sstfb: cannot remap register area %#lx\n",
  1374			        fix->mmio_start);
  1375			goto fail_mmio_remap;
  1376		}
  1377		info->screen_base = ioremap(fix->smem_start, 0x400000);
  1378		if (!info->screen_base) {
  1379			printk(KERN_ERR "sstfb: cannot remap framebuffer %#lx\n",
  1380			        fix->smem_start);
  1381			goto fail_fb_remap;
  1382		}
  1383	
  1384		if (!sst_init(info, par)) {
  1385			printk(KERN_ERR "sstfb: Init failed\n");
  1386			goto fail;
  1387		}
  1388		sst_get_memsize(info, &fix->smem_len);
  1389		strscpy(fix->id, spec->name, sizeof(fix->id));
  1390	
  1391		printk(KERN_INFO "%s (revision %d) with %s dac\n",
  1392			fix->id, par->revision, par->dac_sw.name);
  1393		printk(KERN_INFO "framebuffer at %#lx, mapped to 0x%p, size %dMB\n",
  1394		        fix->smem_start, info->screen_base,
  1395		        fix->smem_len >> 20);
  1396	
  1397		f_ddprintk("regbase_virt: %p\n", par->mmio_vbase);
  1398		f_ddprintk("membase_phys: %#lx\n", fix->smem_start);
  1399		f_ddprintk("fbbase_virt: %p\n", info->screen_base);
  1400	
  1401		info->fbops	= &sstfb_ops;
  1402		info->pseudo_palette = par->palette;
  1403	
  1404		fix->type	= FB_TYPE_PACKED_PIXELS;
  1405		fix->visual	= FB_VISUAL_TRUECOLOR;
  1406		fix->accel	= FB_ACCEL_NONE;  /* FIXME */
  1407		/*
  1408		 * According to the specs, the linelength must be of 1024 *pixels*
  1409		 * and the 24bpp mode is in fact a 32 bpp mode (and both are in
  1410		 * fact dithered to 16bit).
  1411		 */
  1412		fix->line_length = 2048; /* default value, for 24 or 32bit: 4096 */
  1413	
  1414		fb_find_mode(&info->var, info, mode_option, NULL, 0, NULL, 16);
  1415	
  1416		if (sstfb_check_var(&info->var, info)) {
  1417			printk(KERN_ERR "sstfb: invalid video mode.\n");
  1418			goto fail;
  1419		}
  1420	
  1421		if (sstfb_set_par(info)) {
  1422			printk(KERN_ERR "sstfb: can't set default video mode.\n");
  1423			goto fail;
  1424		}
  1425	
  1426		if (fb_alloc_cmap(&info->cmap, 256, 0)) {
  1427			printk(KERN_ERR "sstfb: can't alloc cmap memory.\n");
  1428			goto fail;
  1429		}
  1430	
  1431		/* register fb */
  1432		info->device = &pdev->dev;
  1433		if (register_framebuffer(info) < 0) {
  1434			printk(KERN_ERR "sstfb: can't register framebuffer.\n");
  1435			goto fail_register;
  1436		}
  1437	
  1438		sstfb_clear_screen(info);
> 1439	#fdef CONFIG_FB_DEVICE
  1440		if (device_create_file(info->dev, &device_attrs[0]))
  1441			printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
  1442	#endif
  1443	
  1444		fb_info(info, "%s frame buffer device at 0x%p\n",
  1445			fix->id, info->screen_base);
  1446	
  1447		return 0;
  1448	
  1449	fail_register:
  1450		fb_dealloc_cmap(&info->cmap);
  1451	fail:
  1452		iounmap(info->screen_base);
  1453	fail_fb_remap:
  1454		iounmap(par->mmio_vbase);
  1455	fail_mmio_remap:
  1456		release_mem_region(fix->smem_start, 0x400000);
  1457	fail_fb_mem:
  1458		release_mem_region(fix->mmio_start, info->fix.mmio_len);
  1459	fail_mmio_mem:
  1460		framebuffer_release(info);
  1461		return -ENXIO; 	/* no voodoo detected */
  1462	}
  1463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

