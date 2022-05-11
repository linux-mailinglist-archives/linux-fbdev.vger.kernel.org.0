Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA783523E98
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 May 2022 22:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347600AbiEKUOc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 May 2022 16:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiEKUOa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 May 2022 16:14:30 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163645AECE
        for <linux-fbdev@vger.kernel.org>; Wed, 11 May 2022 13:14:29 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id y74so3133832vsy.7
        for <linux-fbdev@vger.kernel.org>; Wed, 11 May 2022 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=cGqzklWXWDVELhuS+xgTophtvKPosdcmMHaKUXqQOh0=;
        b=Zt/b536x6W6lxrj7WSSyJ3R79/SObpYlAuibOK028NnHb0ZkrZKGQaeWhGDvnfd0rZ
         rvcHO8nlZxh9Ys3+Vo4Y5staczP4dZTPiy7vAc/0g2Vm+VUxd6f8kKk7Ck1UYVio0lAP
         CQWU7nMp6TNeNtHKhv4Rpee40pbRItjLHC7uwU07NHkMck6/+Sk4x+rKe2p7Qsix22vJ
         6if9mu80NrvliAFKz9V6td3VwnF7OxcEH9J3GKUN3oSJTn9PQIci+z1Jk/epelo1Nxqb
         2Trazwg3YuJa2Moz2lzZF+ylu42K69BkmgHS/oeRpjbfR7pm4KEWSIje2n4ssGbnq/Da
         /dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=cGqzklWXWDVELhuS+xgTophtvKPosdcmMHaKUXqQOh0=;
        b=UbO3PnQRfLB9QiFmpTxSdVplL7rN0h+nEtBx/Qc6Fjx51PXqWAYy0dfrHxj2fBQuQm
         PxyMtzvTqG0e/wovVn/qeL77pK2qrCOIL27+nko8gk1ww2y8CWzlwlmo/7q2lB2jx1Gy
         FeG1dCeXiryp8PHqiPMiGfNi0V3KPRBsimXmBlKUGxExYS0xp66KLxfFCBhde5LzBisw
         SbxkZmkr7Wkh1pDLecdlnzQVPLccHrfW9QfnzvQkBMBUTm/dl6h3vlIrtKRjgTE50t03
         tff33mS6hVgzn+UCujShv67bhGCYBIbN031tCP45baj3pdzH6JMLE0imrddrG+Ndbncq
         h73w==
X-Gm-Message-State: AOAM532YVpQEUdH9aPAxX+5LhkCOtui9J27BRsi8z84PaTgjolSLpiaC
        zAyQ8Odr45FuWl55dweN3OgVlOO5Yz1Ase98bFU=
X-Google-Smtp-Source: ABdhPJz94QPolV8Q9u+ZGAqId7oCkbxCM9t58kplepURfRm/t3W45SCpLYTPciTyKA6pzYqG2tShTyWNtYdFh6OzdQU=
X-Received: by 2002:a67:ff0f:0:b0:32c:cf89:a66d with SMTP id
 v15-20020a67ff0f000000b0032ccf89a66dmr14738250vsp.17.1652300068167; Wed, 11
 May 2022 13:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6122:255:0:0:0:0 with HTTP; Wed, 11 May 2022 13:14:27
 -0700 (PDT)
Reply-To: frankmorsonn@aol.com
From:   Barrister Frank Morrison <arth5jhson@gmail.com>
Date:   Wed, 11 May 2022 21:14:27 +0100
Message-ID: <CAON3qUjNZSm201dRHBD5bbFzzVVz=10350Am37-fbxCOHuCahQ@mail.gmail.com>
Subject: Lkd
To:     arth5jhson@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello,
I'm Barrister Arthur Johnson. Please I wish to have a communication with you.
I am waiting for your answer.
Regards,
Barr.Arthur Johnson
