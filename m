Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E76C75D871
	for <lists+linux-fbdev@lfdr.de>; Sat, 22 Jul 2023 02:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjGVAva (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Jul 2023 20:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjGVAv3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Jul 2023 20:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C988E271F
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jul 2023 17:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689987034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sJYv5x+k3Q4NH1eRkFB8Sxq+BIWu4PhXjDBrAF/r5Hk=;
        b=P0hLbVKwYEFGGy3X3MYe9M/mqrUu0iQeWViYiuYc58rU4pNLs34jPzFPiVyjInqfA62m6D
        bjppEXFUDcmcu2npcIkYwf7Is5gUb2COPUZ3GnK3VjeXN9z3wTu3ZMwozf3WhwBFDJZTI4
        v8N8xaN25jR/LQwfiXFw09QbL8yE+0M=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-aIa2b4zONSCS01xUSSEZOQ-1; Fri, 21 Jul 2023 20:50:31 -0400
X-MC-Unique: aIa2b4zONSCS01xUSSEZOQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b70c44b5fdso24964221fa.1
        for <linux-fbdev@vger.kernel.org>; Fri, 21 Jul 2023 17:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689987029; x=1690591829;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJYv5x+k3Q4NH1eRkFB8Sxq+BIWu4PhXjDBrAF/r5Hk=;
        b=IItTfzIrk4KCbAh2ivAK89rWt4oGUpJf4HOYcOrAmcgV6yLh+o8WFwGnfmUEMYGibh
         qeew5xbIHEQbOrWZkM+2h869f1RV46vj7vM/aJ1VFyAPLyd8NTF4xHprXNM19+q80fYr
         GXN4ah9CVOO97XVO6xiWyJp69jY88G/bcB212OYJmF7B8QkD9FbTsXUT6eTKk7uV47qt
         Cf7yXrFz9Ywb3WFo/2eYmoRFwd6RyZhgKn021fGZryxxKuTQoedaqHLr+kdD+SzyZVaD
         IWM4dHi5B9QC6eOF16Yg1f8o3Tv3CV46ZumgaUv55et2o3/NYPjNhtAw2vdyXGD8R2Mf
         AMsw==
X-Gm-Message-State: ABy/qLaIipqfp2SmJ8PzB5y9qpMd0WLGxIGCWqz3BQWka0BtKgVbQYik
        qd/rMldlter2Z/od3XBDO+jHxdqsmaJI3a7RVt7jB0+OT8IyvC7vtMdsXo9X+qqTcp/ByJUE3y6
        YTCm2uS2LvC6EKb/2HnNqjNM=
X-Received: by 2002:a2e:9b06:0:b0:2b9:601d:2c3 with SMTP id u6-20020a2e9b06000000b002b9601d02c3mr2616254lji.37.1689987029680;
        Fri, 21 Jul 2023 17:50:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFD2Ck7YGPgxYDau0n94eHp8Rfq71xrJ0iC1YYZPposhWAbzYQSuWbwHpQN486Xy3RRLOn9ew==
X-Received: by 2002:a2e:9b06:0:b0:2b9:601d:2c3 with SMTP id u6-20020a2e9b06000000b002b9601d02c3mr2616243lji.37.1689987029310;
        Fri, 21 Jul 2023 17:50:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b003fbe561f6a3sm7028287wmq.37.2023.07.21.17.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 17:50:28 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <CANiq72=RBUdFdt8=k-AACxXWrbnqfiaiViNUNxvwzGNCDkjwQA@mail.gmail.com>
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
 <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
 <87mszou7kz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=RBUdFdt8=k-AACxXWrbnqfiaiViNUNxvwzGNCDkjwQA@mail.gmail.com>
Date:   Sat, 22 Jul 2023 02:50:28 +0200
Message-ID: <87jzusu5uz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Sat, Jul 22, 2023 at 2:13=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Oh, interesting. I wonder why that couldn't had been a fbdev driver then
>> using FB_VISUAL_MONO01? I'll reword then the commit message before apply
>> to the following instead:
>
> It is :)
>
>     .type =3D FB_TYPE_PACKED_PIXELS,
>     .visual =3D FB_VISUAL_MONO10,
>

Ah! Should had read the driver before commenting then :)

> The original distinction was more about having a place where to put
> small, simple displays that were not your usual "screen", where you
> would typically draw a custom UI, probably controlled with a few
> custom buttons, etc.
>

Got it. Then that's yet another argument for adding the auxdisplay
drivers under the same "Graphics support" menu.

>> Perfect, thanks!
>
> My pleasure!
>
> Cheers,
> Miguel
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

