Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A5B6AFCE0
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Mar 2023 03:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjCHCYU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 7 Mar 2023 21:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjCHCYT (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 7 Mar 2023 21:24:19 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EC5A2188
        for <linux-fbdev@vger.kernel.org>; Tue,  7 Mar 2023 18:24:18 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id jo29so10335764qvb.0
        for <linux-fbdev@vger.kernel.org>; Tue, 07 Mar 2023 18:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678242257;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZVkFn3YwdxEdThkVHM6Q9Cxc1dE09qwtEAvH/ySM1g=;
        b=CtjP9Nt2nfoMgS66Z4m2eIas6RmjzBjTI/wDuYmfNk6/5g5MPjkunjcWDV70SKX0WG
         fbta4fzcw6eYC02OsK9bzy+E5fEmvu5F0Mp1BqPyt7Yeu51wr6dITXpfcpEZH4wIqh77
         eDRp0taVIt7Vw9ki3Zlj1wupZnNnJ9Cs0S7G5TT2nfYT8bSHxrBilUUDuSpu0wPK4HSc
         2MX/pDGAh9ehavuI6OVXRmlCXTPzCS0SH7+uTjfrbDoWOVSUHUxreYMbFufM7GjeFeF5
         /yDxk7arPdIz5hT/8Yq2PFCb7z8dNF+jgvgGbh3X9BhEp9dPyuMNonWppR/sYkHtAQvj
         PezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678242257;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZVkFn3YwdxEdThkVHM6Q9Cxc1dE09qwtEAvH/ySM1g=;
        b=FfeapA4D++93+b+WcEcqGzfIJbtmzEWpW6IATF5ixhX35ourVC3gobMAXRc5ZSx5pu
         QKq8glrnT1wvMjxQEiM3pc5YCDWS/yQgDRWlPHqeswf6UQZ5r/tHzjFb6ydm1qCOwVk1
         I4MiCNQ+MieGzf1jnGQFEDih/qQdbQm4WUyOVisaICpLg0cexY5bVkJp6V1mX4n1jcJH
         3r2DQU+KMsgOARJbfHl+uHexZAb4lGZcrEWrqmvth1Ocy2zuk2c3Co+loECf5bK8T65m
         GG5mae+QJ1oKpdVxXUC8dF5XO2+0J6FhQefWgfRUteEp7QiFS7CYSsYPVw3srB66LIQL
         PzcQ==
X-Gm-Message-State: AO0yUKUdG1Z6vQ0uaphfYdlg1oH0o1C20vhe8R2p2oBzhnLiD1m0F42T
        MrBxJ6dVotCTz/J3dNfixzlWl/ArW1aRqGuEpNc=
X-Google-Smtp-Source: AK7set+C+JgOycA99p2cD47yy2wqMN6v8YcFu0apnVHdGVRQDV7Bgxy52FyuzXMguDiISCYknHsMyMS1p0DL/KsB+NA=
X-Received: by 2002:ad4:5891:0:b0:537:7476:41fb with SMTP id
 dz17-20020ad45891000000b00537747641fbmr4394975qvb.7.1678242257171; Tue, 07
 Mar 2023 18:24:17 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:420c:b0:597:e9b8:1226 with HTTP; Tue, 7 Mar 2023
 18:24:16 -0800 (PST)
Reply-To: sgtkaylam28@gmail.com
From:   sgt kayla manthey <mamancherif2018@gmail.com>
Date:   Wed, 8 Mar 2023 02:24:16 +0000
Message-ID: <CAHTj9E425PKvzfKewKvodcegiqUDZg=NQ88ovc24qvz9LobxXA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f32 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mamancherif2018[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mamancherif2018[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylam28[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
Hello,
Please did you receive my previous letter? write me back
