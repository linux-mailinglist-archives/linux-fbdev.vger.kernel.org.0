Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10494565157
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Jul 2022 11:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbiGDJwg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 4 Jul 2022 05:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbiGDJwf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 4 Jul 2022 05:52:35 -0400
X-Greylist: delayed 921 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Jul 2022 02:52:34 PDT
Received: from smtp2.tsag.net (smtp2.tsag.net [208.118.68.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA9DDE87;
        Mon,  4 Jul 2022 02:52:34 -0700 (PDT)
Received: from linuxfromscratch.org (rivendell.linuxfromscratch.org [208.118.68.85])
        (user=smtprelay@linuxfromscratch.org mech=PLAIN bits=0)
        by smtp2.tsag.net  with ESMTP id 2649aqN7013971-2649aqN9013971
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 4 Jul 2022 03:36:53 -0600
Received: from [192.168.124.21] (unknown [113.140.29.6])
        by linuxfromscratch.org (Postfix) with ESMTPSA id C33161C33D0;
        Mon,  4 Jul 2022 09:36:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
        s=cert4; t=1656927412;
        bh=3QkRAk/rtlLuT2thgUbQAE2edONMPQV0DJmdezwylNk=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=osOSOfHtB0PqwShcsPEqL9Qe4l2l337q+dHrDoMqbi4409pHYoN71DCkQgHX/+Gl1
         SBks7IioLmCWcklUuXVd68/tMa+g6ISl6aG/khyJdg5Bd3gkziP2leywa94HZw9ozV
         AWfBHwmd3scuwftYLeRhj8HBUcSB2zXih0Pa66ieHVAJucr0rSacmH0eEzTSwe8DlT
         CUQiFzAqClibOmxUUQVptOAoNISZaQ6XcCE2/+G4d6jWOBqtAXD5aLzn5vRcNEPIJb
         3iPpP9slIt8AWxapoSwjXXXqxyikeUY4rYVuVqXsqXkHMLD59acMqD3D3Yqhfc6kCz
         W57T/zTwQILRg==
Message-ID: <64c753c98488a64b470009e45769ceab29fd8130.camel@linuxfromscratch.org>
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
From:   Xi Ruoyao <xry111@linuxfromscratch.org>
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Zack Rusin <zackr@vmware.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "deller@gmx.de" <deller@gmx.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "lersek@redhat.com" <lersek@redhat.com>
Date:   Mon, 04 Jul 2022 17:36:31 +0800
In-Reply-To: <aa144e20-a555-5c30-4796-09713c12ab0e@redhat.com>
References: <20220607182338.344270-1-javierm@redhat.com>
         <20220607182338.344270-4-javierm@redhat.com>
         <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
         <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
         <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
         <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
         <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
         <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
         <aa144e20-a555-5c30-4796-09713c12ab0e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-FEAS-Auth-User: smtprelay@linuxfromscratch.org
X-FEAS-DKIM: Valid
Authentication-Results: smtp2.tsag.net;
        dkim=pass header.i=@linuxfromscratch.org;
        dmarc=pass header.from=linuxfromscratch.org
X-FE-Policy-ID: 0:14:3:linuxfromscratch.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, 2022-06-17 at 08:46 +0200, Javier Martinez Canillas wrote:
> Hello Zack,
>=20
> On 6/17/22 03:35, Zack Rusin wrote:
> > On Fri, 2022-06-17 at 01:21 +0200, Javier Martinez Canillas wrote:
> > > On 6/17/22 00:18, Javier Martinez Canillas wrote:
> > > > On 6/16/22 23:03, Zack Rusin wrote:
> > >=20
> > > [snip]
> > >=20
> > > >=20
> > > > I'll look at this tomorrow but in the meantime, could you please lo=
ok if the following
> > > > commits on top of drm-misc-next help ?
> > > >=20
> > > > d258d00fb9c7 fbdev: efifb: Cleanup fb_info in .fb_destroy rather th=
an .remove
> > > > 1b5853dfab7f fbdev: efifb: Fix a use-after-free due early fb_info c=
leanup
> > > >=20
> > >=20
> > > Scratch that. I see in your config now that you are not using efifb b=
ut instead
> > > simpledrm: CONFIG_DRM_SIMPLEDRM=3Dy, CONFIG_SYSFB_SIMPLEFB=3Dy and CO=
NFIG_DRM_VMWGFX.
> > >=20
> > > Since you mentioned efifb I misunderstood that you are using it. Anyw=
ays, as
> > > said I'll investigate this tomorrow.
> >=20
> > Sounds good. Let me know if you'd like me to try it without SIMPLEFB.
> >=20
>=20
> Yes, please do. Either with CONFIG_SYSFB_SIMPLEFB disabled and CONFIG_FB_=
EFI
> enabled (so that "efi-framebuffer" is registered and efifb probed) or wit=
h
> CONFIG_SYSFB_SIMPLEFB but CONFIG_FB_SIMPLE enabled (so "simple-framebuffe=
r
> is used too but with simplefb instead of simpledrm).
> =C2=A0
> I'm not able to reproduce, it would be useful to have another data point.

Also happening for me with CONFIG_SYSFB_SIMPLEFB, on a Intel Core i7-
1065G7 (with iGPU).

Reverting this commit on top of 5.19-rc5 "fixes" the issue.
