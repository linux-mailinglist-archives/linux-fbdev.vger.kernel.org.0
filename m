Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456664751A3
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Dec 2021 05:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhLOEdz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 14 Dec 2021 23:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236534AbhLOEdz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 14 Dec 2021 23:33:55 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E7DC061574
        for <linux-fbdev@vger.kernel.org>; Tue, 14 Dec 2021 20:33:55 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id v22so20616893qtx.8
        for <linux-fbdev@vger.kernel.org>; Tue, 14 Dec 2021 20:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Un4Qg2mtadAK4QldVbLnA81+HtRHjcmdeWxKah39+H0=;
        b=Swe158upuzOcGtWgnaFnRZs+lNuJefeK6Y+TEo5HXrxRCoQvg8gz1uPVXpgvmtUriv
         cZRqFljY0NQlD9HL/gBY7sJpc+HgXV2xIz2eAZ5xamCa18P+KkW+LcC14S1i4GkpVWWI
         QjcB4+Hmgq1TB3S+Hq5wqjcUsKMPLpHleIeEE2mWqPXUBGZSETQKBZiI+NBis4OiXxqL
         8xq4RNnEYLoovA2PsuFngM56NdPiFT/I+/DZ/Iwpu66hBqqzdWZuL9KNlOIBsXCgMyQY
         ERHDctVFU7lF4y0si1jzN0ECGn+rbgkSfMXJoATYw28kBCECq9HTmHgzPKGKPAtRrj9r
         Vm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=Un4Qg2mtadAK4QldVbLnA81+HtRHjcmdeWxKah39+H0=;
        b=sQfR4TR0frWKBbcy10k4V5B4DhkLW/7OEvnQb48OH6dzdP459UqlpYr7WM8iosS4zX
         RNHF8ySBClDjoc13hpzNIl4RppAO1lNKQRbfhjw8kKhdvsHUbskHM67GmNKln/R5j1sl
         4Y2/vAk8O39ffYQAXq95ULuOP1Qdc6NdHszwvg25arcKykUJnx9aV0xFOREDf3EoCnSO
         qahYjq0fTm1jGIjTpQj5JPaHhhxf9AhpV6iCbMLSaH56Xqz4aIKY448t6NioxOVRh0vy
         geW5BX3tkPpIqgdr5khyxt7bkWU9inGSc2gIdopaXOW5f2cchQkI39OEHfAqPyRMOfGG
         aciw==
X-Gm-Message-State: AOAM531NoaimjvAQl1X6WVw1ELpnH0J22s+osNnzUUDDvlhjbRPUmUs9
        eMZ1Ee9lYJuxOxLUHs/7BAdZocGVnHXS+ge53lQ=
X-Google-Smtp-Source: ABdhPJztChy36AVbPnFcNM/p7rkO7ZZtSZGFpNkFDL26x8ZDtuAo6SDcVQkY3A39+uALcl3qIF8ik4nfW1doWfMP+P0=
X-Received: by 2002:a05:622a:40a:: with SMTP id n10mr10348362qtx.161.1639542834119;
 Tue, 14 Dec 2021 20:33:54 -0800 (PST)
MIME-Version: 1.0
Sender: landrlne2000@gmail.com
Received: by 2002:a05:6214:5186:0:0:0:0 with HTTP; Tue, 14 Dec 2021 20:33:53
 -0800 (PST)
From:   "Mrs. Lia Ahil Ahil" <mrsliaahila@gmail.com>
Date:   Wed, 15 Dec 2021 04:33:53 +0000
X-Google-Sender-Auth: Y2oNkbAIg9Z7Bw6ED4qZpLLwaDo
Message-ID: <CAAtc_K8vZhqCt3daoBU2ueFAsM99qqtuZD2UzrDU91RLu7JxDQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Gr=C3=BC=C3=9Fe, wie geht es dir heute, hast du die E-Mail erhalten, die ic=
h dir
vor ein paar Tagen geschickt habe? Bitte melde dich f=C3=BCr weitere
Informationen bei mir zur=C3=BCck
