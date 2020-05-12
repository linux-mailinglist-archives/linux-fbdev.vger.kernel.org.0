Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEA41CFF98
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2020 22:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731219AbgELUjW (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 May 2020 16:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731209AbgELUjV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 May 2020 16:39:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A5FC061A0C
        for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2020 13:39:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id e26so23703645wmk.5
        for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2020 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kRsK3KLOy1f2Jn1LmZpT0Xx2/BeSbNfde+QeWP2ATBM=;
        b=P2c64g8vKwFXaIcqkgQ+6GhfvqQjnoe4MgMa0vZ0CFj2TEU48mA/6A9y7u4SAmq+Du
         FW9ulFZjZbbicXHnPIj2bnKIqplJG8DCrbkcnFc4VO/f57zw4yQh84KVKF2HfR6jVv0b
         Oe+wwSSVpx70MDDhk4jjzk43Z4wglBxCABVNcS/A0ujD1o/5iURxUnRiMHpHW+Ck/62m
         K8qLneFgpcqJJT+I6qNMs526XHxL6gjK0Cs7s6BOTfOgGSOVU7o03gVn8NMayrH8aLLX
         lhOlanJafsr5rRMaI/Y+Cp1vEyhQ3RA/P2pi8k6IVk5vwWSeQr9bNNTtVVbkpc7aziYx
         KUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kRsK3KLOy1f2Jn1LmZpT0Xx2/BeSbNfde+QeWP2ATBM=;
        b=GUvi2Fu09/ksKA/6XYIbUeYjGmmZzqAMejJ8WSeVmtiyjN3Tw+Vkqguyc2HS1Sr+mM
         SqjQreORl+J8tBGr9F0i585fNVqMJIuvU0Gmgw6QE4TqXn7HfM5hNMXIqf8os7HW1lYQ
         bVVgj+JLmp4TYZcC7sJcdTLfLgd/MOGBtuiRPMOLh8E7Z7LB1K6iqvUqMV7CyA+f3Dl2
         g3JcTG3c8tJIqQ6srlv2atkCYPneA4BYt2no0XrvtIuVB3tDzd2NypaG6RdayBP7jbvu
         faFyIalavF4tx6wTVGRPIRrcG7zDArlNAJpqCnhfcRAtl9N+P+aDG5y1t5V6yzxWIPh5
         R+mQ==
X-Gm-Message-State: AGi0PuYiY7/eMYQ9JoBb2sZ8TFhDfJNeourpvplUuLUboeh/JejUZ36K
        lMy7d3DXpX5wQLP7CebpbXIIKAzi
X-Google-Smtp-Source: APiQypKaKQf1rS0hjwC5MBRtaUEG9mSS0AyhZnbLFvlDgmxltYIE6DOYt1KTTvO2nCTaOZRDr9vZqA==
X-Received: by 2002:a7b:c941:: with SMTP id i1mr36625596wml.132.1589315960043;
        Tue, 12 May 2020 13:39:20 -0700 (PDT)
Received: from ?IPv6:2a02:a451:7f4b:1:2c91:4cff:71a2:52de? ([2a02:a451:7f4b:1:2c91:4cff:71a2:52de])
        by smtp.gmail.com with ESMTPSA id r11sm13349374wro.15.2020.05.12.13.39.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 13:39:19 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: bug: kernel bug when unbinding EFI framebuffer
From:   Fabian Mastenbroek <mail.fabian.m@gmail.com>
In-Reply-To: <CAPM=9tx1ASp3ubnyRWk-zM0ppyW-pWE=o4jHAxOkT9oGU+Yx-g@mail.gmail.com>
Date:   Tue, 12 May 2020 22:39:18 +0200
Cc:     Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <77F726E1-2C8C-4096-BDD9-D3D2A5960611@gmail.com>
References: <45B8BCE9-2156-4248-8102-58736D02752D@gmail.com>
 <CAPM=9tx1ASp3ubnyRWk-zM0ppyW-pWE=o4jHAxOkT9oGU+Yx-g@mail.gmail.com>
To:     Dave Airlie <airlied@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Ah that explains it. I did not realize that nouveau already unregisters =
the framebuffer.=20

To answer your question on why: I wanted to isolate a GPU so that I pass =
it forward to a VM. However, as I understand now, I shouldn=E2=80=99t =
need to touch the EFI framebuffer when using nouveau.

Best regards,

Fabian Mastenbroek

> On 12 May 2020, at 22:03, Dave Airlie <airlied@gmail.com> wrote:
>=20
> On Sat, 2 May 2020 at 22:36, Fabian Mastenbroek =
<mail.fabian.m@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>> When I try to unbind the EFI framebuffer via:
>>=20
>>        echo -n efi-framebuffer.0 > =
/sys/bus/platform/drivers/efi-framebuffer/unbind
>=20
> Can I ask why?
>=20
> nouveau kicks the efifb off the hw, and unregisters it, but when you
> unbind it it tries to unregister again.
>=20
> It might be possible to block this, but not sure of the point, efifb
> is a built-in, you can't unload the module to save memory.
>=20
> Dave.

