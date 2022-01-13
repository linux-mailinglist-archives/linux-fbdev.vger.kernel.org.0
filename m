Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E447848E061
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jan 2022 23:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238006AbiAMWhf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jan 2022 17:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbiAMWhf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jan 2022 17:37:35 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F322CC06173E
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jan 2022 14:37:34 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so12514977pjp.0
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jan 2022 14:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=hw2QHm9/aNktZ/qzuQXSkRUy05slaJ/WvDaiJCgGHFMXySDZvvIGzDhgSbZJUdTECM
         MdsyglRV4bVtBlgs6NlTa2OZZQb8UXHcvDPyZenDaXGGB84cNoYGLo+l8eZZsEvrq5Im
         0QFow4ZK52miBtwwdUrm32z8LGCqAekGP4+gI9Ckh2M8rFBHbSy7KEygQ4ef7wXS5trM
         eFTTa4l+9bAEL29bXzLat9kocoX9b3C/W7UZsV2aG0QfATMgYjukBkx35MGQ/J/HWHpf
         i43S30wchEYddd+UGoUtoAPFM19QSkZ6V57ux5a34QRW2VhSVilvHcgeI6HktJQ3BvcY
         srrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=gEavG7cPtxF5wX0j7iqaywzFmrYarqwskV4cC3lb6V5KoWMSrn+zqmD3NgIbt6u9w0
         l9P5ydmT+xzxtxdVOq1ETLUPDeIt7sVGZ1CFDF1+776r4vTrOrjcwVHCa0/Dgi3gnSp3
         +mA+v591nWjeqFuoWwnmRXukuVu2D+KYgosys6gSyC7rLt2uuBxYr0OBwT+4WpjB5nsr
         dG8hmfguQu509FXjH35iwZAU2Ip8srqGunlJSl0p8sIoUbHemcrkJ5ENp8FwRPflOIQx
         hpUKuT4PrB7CvtYkO//k8KEHuZUE//QSyOuWKF+n8HJBQFP8xCPn6WWehxSM5n4f6LHu
         94sQ==
X-Gm-Message-State: AOAM532+pC3JY4AWYxBdisu6I6ImIt9I4iLMmmGwh+J1znhLjMt6+43R
        kgnLfN+isGjg28JaFe+31NSOmrfYHfEZKjwlLKk=
X-Google-Smtp-Source: ABdhPJxxHHvBgEhkMJqFxQL/kHCrtCcslOvL/VrT0n33mBCtCD1qSBM5W9SIxZcamVWgaajkCahPxuLA483LYyDvu8U=
X-Received: by 2002:a17:902:c443:b0:14a:30f2:95e8 with SMTP id
 m3-20020a170902c44300b0014a30f295e8mr6471213plm.43.1642113454449; Thu, 13 Jan
 2022 14:37:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:37:33
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:37:33 +0100
Message-ID: <CANqBaXW+7Aw2P_8Sghn0knonQ3qJaAEAJ69RZesm9MBxFDG_5A@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
