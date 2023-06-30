Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D76B74423B
	for <lists+linux-fbdev@lfdr.de>; Fri, 30 Jun 2023 20:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjF3Scf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 30 Jun 2023 14:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjF3Sce (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 30 Jun 2023 14:32:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD90D3C2F;
        Fri, 30 Jun 2023 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688149953; x=1719685953;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=AUog1oylk7F8erWTwuZvVpqNmif9eOSht3QwuL4uOG8=;
  b=KK1RfvbhbAh74z3tzwv+CJBtmzNehYTlcpbn4/sGM0VtVNRl7RPKG2Oe
   usWsvVk8XNFb5zzrzCLFzIkE7A/x9Jk4zD4b+OEtSTev2OOVXFb8YS/CH
   4E2ITrdBQ9xhMLR5r8JcxGHWe6NGhr4w4jK+UZfTV6Qz7EvRdEqQPQBxz
   KmetxV6fNdhar/tZAFv+/89lKiuhK4Jh8lyzPrDSJDfvtZX98H3/mQAjb
   IDEEsE3vIVMfmHoQcgBuFY9+t1WLMfBptJ6dXrWaiM6iozkgNoOoqFMNG
   7SnVsrI2jLFYXyw2ro6JbtZAWj8pLkjT2IE0yx02mCMKm8k3sLpTzHeF7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365949330"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="365949330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 11:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="717896031"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="717896031"
Received: from lpascal-mobl.amr.corp.intel.com (HELO localhost) ([10.252.49.62])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 11:32:23 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "15330273260@189.cn" <15330273260@189.cn>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Chai, Thomas" <YiPeng.Chai@amd.com>,
        "Gao, Likun" <Likun.Gao@amd.com>, David Airlie <airlied@gmail.com>,
        Ville Syrjala <ville.syrjala@linux.intel.com>,
        Yi Liu <yi.l.liu@intel.com>, Karol Herbst <kherbst@redhat.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Ben Skeggs <bskeggs@redhat.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        Kevin Tian <kevin.tian@intel.com>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Zhang, Bokun" <Bokun.Zhang@amd.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Abhishek Sahu <abhsahu@nvidia.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Yishai Hadas <yishaih@nvidia.com>,
        Cornelia Huck <cohuck@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH v7 6/8] PCI/VGA: Introduce is_boot_device function
 callback to vga_client_register
In-Reply-To: <20230630174156.GA487980@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230630174156.GA487980@bhelgaas>
Date:   Fri, 30 Jun 2023 21:32:20 +0300
Message-ID: <87v8f4243v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 30 Jun 2023, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Fri, Jun 30, 2023 at 10:14:11AM +0800, suijingfeng wrote:
>> On 2023/6/30 01:44, Limonciello, Mario wrote:
>> > > On 2023/6/29 23:54, Bjorn Helgaas wrote:
>> > > > On Thu, Jun 22, 2023 at 01:08:15PM +0800, Sui Jingfeng wrote:
>
>> > > > 4) Right now we're in the middle of the v6.5 merge window, so new
>> > > >      content, e.g., this series, is too late for v6.5.  Most
>> > > >      maintainers, including me, wait to merge new content until the
>> > > >      merge window closes and a new -rc1 is tagged.  This merge window
>> > > >      should close on July 9, and people will start merging content for
>> > > >      v6.6, typically based on v6.5-rc1.
>> > > 
>> > > Would you will merge all of the patches in this series (e.g. including
>> > > the patch for drm/amdgpu(7/8) and drm/radeon(8/8)) ?
>> > > 
>> > > Or just part of them?
>
> The bulk of this series is drivers/pci changes, so typically I would
> merge all the patches after getting Acked-by tags from the other
> subsystems (DRM and VFIO).

For the (negligible) i915 parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>> Is it possible to merge the PCI/VGA part as fast as possible,
>> especially the PATCH-0006 PCI/VGA: Introduce is_boot_device function
>> callback to vga_client_register
>
> We're in the middle of the v6.5 merge window, so it's too late to add
> things to v6.5-rc1.  The most likely path for new material like this
> would be to queue it for v6.6, which means I would merge it after
> v6.5-rc1 is tagged (that tag will probably happen on July 9).

Perhaps the part that causes confusion here is that the drm-misc-next
and drm-intel-next branches, for example, are always open for new
patches; it's just that there's a cutoff at around rc5/rc6 after which
they start targeting the next+1 release. We basically hide the merge
window from a lot of drm developers.

> It would then be in -next until the v6.6 merge window opens (likely in
> September), when it would be merged into Linus' tree.
>
> If the series fixes a regression or other major defect, it's
> *possible* to merge things earlier, so they appear in v6.5.  But this
> series doesn't seem to fall in that category, so I think v6.6 is a
> more realistic target.
>
> Merging for v6.6 would include both the PCI parts and the DRM parts at
> the same time, so hopefully that addresses your dependency concerns.

I guess the main question is whether Sui Jingfeng has follow-up work
planned in drm that depends on these being merged. This would set that
back by a full release. (But it happens.)

BR,
Jani.



>
> I suggest that you wait until v6.5-rc1, rebase your patches so they
> apply cleanly on that tag, collect all the Reviewed-by and Acked-by
> tags, include them in your commit logs, and then repost them.
>
> Bjorn

-- 
Jani Nikula, Intel Open Source Graphics Center
