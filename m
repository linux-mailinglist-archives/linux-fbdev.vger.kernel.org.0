Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834945FC15C
	for <lists+linux-fbdev@lfdr.de>; Wed, 12 Oct 2022 09:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJLHpG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 12 Oct 2022 03:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiJLHpF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 12 Oct 2022 03:45:05 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D2A1838A
        for <linux-fbdev@vger.kernel.org>; Wed, 12 Oct 2022 00:45:03 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 808A43200936;
        Wed, 12 Oct 2022 03:45:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 03:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1665560701; x=1665647101; bh=7YAQuizW1H
        09X/Vy78bUOvfH4cmFBBJBnKdNJKbi+rc=; b=ESKrS8/ccbuz9mwVUC+zMk4GNA
        22fuf8RHLpCplxs5b1w2q36jCntK/WWIwxEBnjHEPHyFvyFGMAilbX/hGJ/qpimU
        /y+fh0scVKseSeC2jsdK9V76JumFLhbezVqaZGXsDbVzRqdVOsI7Q+iQSaFCJBX2
        AykWBgg6mT3MDF8K22vDnprgDyaDaPJDJwBLg/KYELA/uD2K0USXuPqefwctsaww
        sXoPtVs7pMJay71/ylHFhhax7byXOlgHDs+Kur40A87uNzt+blm3va+BB7UCun/k
        tLhTrIkv+w2ij4uoq5LXyYYve4jK3tkJznODx1qJvAraT88atGsy4cDTwXBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665560701; x=1665647101; bh=7YAQuizW1H09X/Vy78bUOvfH4cmF
        BBJBnKdNJKbi+rc=; b=Jcr3VMp5JzsrkN+epBnjEVUHCDdAKKUgH225CYICaXEA
        6zIuzpIqfv2gzFn9th41YShF4vXBD7EmcMa7uyXj8DbwzOTqaLSC3yiR7WZ8NUS8
        CiERUU+ZaFAjDjGDFDAMWu8kFldBI0uvh053YqX640v/xHW9C90KSGW8GHZbCva3
        yHtzW7LqpwYt7JpFdBAspa4ZwkRoqRfXsKt2kWH3Fe3+LXYfYiTIQgRKx9Abb7k9
        OQJdqmouFmm6l4Bp5+G+JoEs8xhE8ho9uub85O6yyRZ2zhifm3f1Jwt8ZyZvbPas
        74e3bEoVjjNrIA+ssLw/JQuvJikmVrKmoJ8v6YO9kg==
X-ME-Sender: <xms:fHBGY1xcV-qP-BULFIaViUw7ZOmRox1EfSTkTg35kHop6JXNekX6bg>
    <xme:fHBGY1QX83hsR2nGVpNCHsbyeaJK3n6d6QPLG7_Z8yKjRvwhRbA7wylZymskoy2j7
    9HNYbeaURGIMIvDLjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:fHBGY_W-RjfRpCSNPmrRkYm2o4glaUtE9JGUc2zoZ7TDPWmF0EHtAA>
    <xmx:fHBGY3jYbt3UrphUhoSxas6T2Gqc8p1A7TOUGptVUT4g0n_T70ZvYA>
    <xmx:fHBGY3C_kbkdTelWUeEv7Zcd911XrCTvJ05K9D1jqE3iZ335Brdgvg>
    <xmx:fXBGY3wVpFALp17mMMn9iZAqiJpYE-zmSpSp3bpIKGIkLFk-l-j57w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 90177B60086; Wed, 12 Oct 2022 03:45:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
In-Reply-To: <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
Date:   Wed, 12 Oct 2022 09:44:39 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Javier Martinez Canillas" <javierm@redhat.com>,
        "David Airlie" <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
        maxime@cerno.tech, sam@ravnborg.org,
        "Michal Suchanek" <msuchanek@suse.de>,
        "Michael Ellerman" <mpe@ellerman.id.au>, benh@kernel.crashing.org,
        "Paul Mackerras" <paulus@samba.org>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Oct 12, 2022, at 9:40 AM, Thomas Zimmermann wrote:
> Am 12.10.22 um 09:17 schrieb Arnd Bergmann:
>> On Wed, Oct 12, 2022, at 8:46 AM, Thomas Zimmermann wrote:
>
>> Does qemu mark the device has having a particular endianess then, or
>> does it switch the layout of the framebuffer to match what the CPU
>> does?
>
> The latter. On neither architecture does qemu expose this flag. The 
> default endianess corresponds to the host.

"host" as in the machine that qemu runs on, or the machine that is
being emulated? I suppose it would be broken either way, but in the
latter case, we could get away with detecting that the machine is
running under qemu.

    Arnd
