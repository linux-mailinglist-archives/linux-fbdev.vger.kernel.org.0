Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575022FE535
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 Jan 2021 09:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbhAUIkI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 21 Jan 2021 03:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbhAUITW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 21 Jan 2021 03:19:22 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D28C061575
        for <linux-fbdev@vger.kernel.org>; Thu, 21 Jan 2021 00:18:31 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b26so1311139lff.9
        for <linux-fbdev@vger.kernel.org>; Thu, 21 Jan 2021 00:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=X9zmG8lFAdgbl7MVHthMb9bEiasw1dUK/9s7H2sIrUM=;
        b=pszAplo8PbBItpgM0mt4DipHkkEhHD8xwY6JogpbuJz/s3ougGts5GbW7TKt62vO/4
         TUmHMSni0X2TmOzTk3BHxwIinbQ979ge4G1tuq5Al9WljSGCUiNmXt6C26cbrJllGkp3
         BWgXFZNx2Pi749Feh/RzKwbg9EioVqdEKiclha3sr8mowl5Nuw9LCKmPhe+/2EbZHd2p
         /IM4UYJn4YXYLA2hq2eXUei8cguk0ursC9wf3m0BJ41snPna0TpIK+grXT9kFmaxXU58
         kkLMw26SCYMQfPv9OPfzvK87uwyifb9QQ63N6+kM54wGjoa/KS+udQSpWrJld8maTPkK
         oibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=X9zmG8lFAdgbl7MVHthMb9bEiasw1dUK/9s7H2sIrUM=;
        b=QVkJEl2CyhdcWnhfRgS4patBv00HyMlctiMwhEugHrCXLtwTZ8zZmp2CoDZFLWGId7
         ai1VKp26Q0ataCRYb5GA19m8HnEJy+1B6/tdH3p3miF+7sRtQUZXTQCiTgdy3/065GR0
         MvOB/9TEdUq1DbWYliXB+xeTnXaVFs31axmdB/aCnjO+5/Ua0NJ89v5quxWOnMSDQoV9
         Tknlk98LGmqwCE7qZ/RS9Ss9w4Vdff6j3nIMmGPCnIQt5GvOQux43wh3o/V94dfUKCE2
         62VW6yXYqYwyu50bSSwIai6K550ndo+/tiq9JqcWy1H63S4lriNF+pfFxa6nsJqNE2fB
         ytKg==
X-Gm-Message-State: AOAM533rPGuPZ6gZ2pzQvOrfC8NknOBqrGoR5gFqZa23dx/7bGu+6N3y
        UTeO4lyNnUhREPEK8gcGZ18YmZgFR9P4Qek6XOX1oIox9Y8=
X-Google-Smtp-Source: ABdhPJwWKqB7p7EFe0bvSLHNANt+2tNmrkVB+zflr6eHstYDpl0wpfjCpGbHyGItGEm3TJR95QUse+jDyAAqb+G/0p0=
X-Received: by 2002:a19:ac0c:: with SMTP id g12mr6220151lfc.51.1611217110022;
 Thu, 21 Jan 2021 00:18:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:209:0:0:0:0:0 with HTTP; Thu, 21 Jan 2021 00:18:28 -0800 (PST)
In-Reply-To: <CACgpvh=Ni6cb4Octw5BtfqoK=sNAG9yik-c05vNqxYB0wjma-g@mail.gmail.com>
References: <CACgpvh=Ni6cb4Octw5BtfqoK=sNAG9yik-c05vNqxYB0wjma-g@mail.gmail.com>
From:   willson mutanda <jkdodj9474@gmail.com>
Date:   Thu, 21 Jan 2021 00:18:28 -0800
Message-ID: <CACgpvh=-==_iiJCgYOvhLYnKrHPUW3jOMKeEvvSNOw2bxzN=dg@mail.gmail.com>
Subject: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello my friend

My name is Willson J. Mutanda. Personal assistance to Mr. Andrew  who
is a Gold and Diamond mining contractor and a business man here in
South Africa who passed away a few years ago. I am writing to you due
to the urgency of the matter, all effort to locate his relatives after
his sudden death failed.

Please, I demand your consent to present you as his heir. I want you
to stand as his relative to inherit his Bitcoin investment valued at
(Two  Million two hundred British Pounds) with the Investment company
before it will be confiscated. The fund has been dormant since 2015,
the Company is about to confiscate the Investment as an unclaimed
deposit.

I got your contact on the internet and decided to contact you as you
have the same name as my master. And I hope you will not expose me
even if you don=E2=80=99t want to help me. This deal should be a secret
between me and you even after archiving this aim.

 I can guarantee that this case will be executed under a legitimate
arrangement that will protect you and me from any breach of law.  All
I require from you is your honest cooperation to enable us to see this
transaction through. I hope to hear from you immediately after you
read this message for more details.

Please contact my private email below for security reasons if you are
willing to assist me on this urgent matter. I learnt your language is
not English; please respond to me with English if you can write with
English


Thanks in advance and God bless you,
willson  j mutanda

Email:  mutanda.j.willson@gmail.com
