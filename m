Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C455E74B308
	for <lists+linux-fbdev@lfdr.de>; Fri,  7 Jul 2023 16:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjGGO20 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 7 Jul 2023 10:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbjGGO2Z (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Fri, 7 Jul 2023 10:28:25 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AB2199F;
        Fri,  7 Jul 2023 07:28:23 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id D1B245C0158;
        Fri,  7 Jul 2023 10:28:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 07 Jul 2023 10:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1688740102; x=1688826502; bh=PRCJoByWe+jzYViHJySz4cgcOiF7hvymZA3
        KbZ+oY2Y=; b=SQC42SJyIUH6HBC+3wWyAI8Q8ZTOPjSPWkoCdYZg3n+YgJ8rYr7
        8Yd/pZNWJuReBgg1FKSG0vonD8XrZwzeYYq6ytR/gOUHaghSGJHC5L+QETUEex9P
        rNPDiecC2xrjvJEslLJLG8/6nkzD+dh/CoGmNZlv8GC7cKh+bdxH4ql0oqWk5mqM
        xksv4NObeVk2gNWz6Rl1Wge+peEo6eqgkazVYjmvmwt121hSaIJHQp/HYoDTqJvc
        rh1OkSL2tihN+3yc4lf1Bh3eq3qDG83JPjHz13+8JfKcEQjxb9y8/p6+KvRtKl0Y
        ppfyNS7YeLDRG3XpLS58SpvlKdDfnW2BmaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1688740102; x=1688826502; bh=PRCJoByWe+jzYViHJySz4cgcOiF7hvymZA3
        KbZ+oY2Y=; b=Vt+uJAbyT853SlzTCvpdCfXXfkkPxhZPFsVRGCsCrK7L7LCiXmv
        D2Wz81H++FMx2xCWDASgDyLzqm4h8I/zavUlOdR99ZNjYVrrfym/YlmQOUNlZJga
        Xc/15KXTBH9MV+UrR/2eoAvAguo0sz6Mv2iE5WjsDGYMBl7T01U66auVbP1v6r0I
        xl/5rM4srHf88MzdZMBkfIyFPEsE69qZsCIvc3Uc3eB2+0IHj6yAtGv1yvO9S8Wl
        2Xu3P928RSn2mDvegGmXuRuskPtFB8aemouLQ5CoQoY9g0V22H0KniI3NbYvMZbQ
        tAzw28oYcldDsAQreYpe+P4OBg3GZE4p6yQ==
X-ME-Sender: <xms:BSGoZK-xFddpFgwnnkWCHC3k2ZffPejzzSL3IJN7mb4pbAEWKfQ42w>
    <xme:BSGoZKv9Kek_rQfcZ8OElDOsb_1--HFZSAmJ1Xlor_2fJ7bk8UxFdyn0XqXMbV5A_
    n-KuEZbs8UpIVSfCXI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvddugdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:BSGoZAD8zBtV9OHPZb7LgBlKayHpz9rMgfG7gBRo-r4j-te92FN2Yg>
    <xmx:BSGoZCe4kpWceq5DZEu4I0BcW9olColr5TaIWK_Weli3DVUFgbNEAw>
    <xmx:BSGoZPM2I1Ooa2DpWRndyBnRsUDnUo24Px63LKANSjew2-PDmXsMBQ>
    <xmx:BiGoZAFs4fgiCXHcNw-2JJHlyxy7WbaoOVtK4pXXRtk2_zGDpsDxhw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D5A5FB60086; Fri,  7 Jul 2023 10:28:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <1c0119cc-7787-4f95-870e-da1c5894625d@app.fastmail.com>
In-Reply-To: <CACRpkdbiDUomH8HLkk_jyJZYc+mEmRaFL8-JasDmd=ooSB62Qw@mail.gmail.com>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-3-arnd@kernel.org>
 <CACRpkdbiDUomH8HLkk_jyJZYc+mEmRaFL8-JasDmd=ooSB62Qw@mail.gmail.com>
Date:   Fri, 07 Jul 2023 16:27:02 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Arnd Bergmann" <arnd@kernel.org>
Cc:     "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Javier Martinez Canillas" <javierm@redhat.com>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Russell King" <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org,
        "Ard Biesheuvel" <ardb@kernel.org>, "Helge Deller" <deller@gmx.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Russell King" <rmk+kernel@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dummycon: limit Arm console size hack to footbridge
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Jul 7, 2023, at 13:33, Linus Walleij wrote:
> On Fri, Jul 7, 2023 at 11:56=E2=80=AFAM Arnd Bergmann <arnd@kernel.org=
> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Tested this before and after patch and it looks the same on the NetWin=
der.
> Tested-by: Linus Walleij <linus.walleij@linaro.org>

Great, thanks for testing!

> The legacy in the cyber2000 FB driver supports pseudocolor which
> makes it a bit hard to rewrite into a simple DRM driver, which is some=
thing
> I could otherwise look into, it's not a very big or complex driver
> after all.

Not sure if that's worth it, my feeling is that we are stuck with
fbdev on a lot of other workstations of the era, so unless someone
puts significant energy into converting all the others as well, there
is little benefit of changing this one. It would be a little different
on platforms that actually run a regular Debian distro kernel that
is shared with modern machines.

Since you have already spent the time to build and test a kernel with
this patch, can you do one more test here and check the text size
reported in the atags on this machine and the actual text sizes you
get from both vgacon and cyber2000fb?

     Arnd
