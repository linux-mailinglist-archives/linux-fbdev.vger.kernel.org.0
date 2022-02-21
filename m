Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEBA4BE52C
	for <lists+linux-fbdev@lfdr.de>; Mon, 21 Feb 2022 19:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358975AbiBUNWc (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 21 Feb 2022 08:22:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbiBUNWb (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 21 Feb 2022 08:22:31 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8603A21806
        for <linux-fbdev@vger.kernel.org>; Mon, 21 Feb 2022 05:22:07 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id f12so8588247vkl.2
        for <linux-fbdev@vger.kernel.org>; Mon, 21 Feb 2022 05:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=94r73LrRNpO7YYFshzYM25uztFOXVTrm/QHuYFLiQ7w=;
        b=mADrFrQ+ZaM0TTq14DVXo+gL51+p2NcBjrN5ntCAKNfmsIAoFYM5Vg05TATz1Ho3Mp
         QntpqOZN3naiWGycPE6mYfwtwAPtneL7Rw/9nMeZB7wOOnN7+w2ZC1J+VfjucP6dvjgH
         lTknf1/DqWRCd1lnEY8XJSo0sGGNKAN/Q2AhiiVd+kM3VozUxI+7uzBPycoXp1Vaqj8M
         p4xbfkLFbWc6MBQeg7cIzVnUHjQm0cWUH2jqTe7+s4ph8qXwOHR43B1LSf5Ms39DYX6u
         tw+yyEkJLsVPXxfaTvunyjyvU9BKx7n8SvP6JAiSZnaM93bNVM1/BrqWWs2xeZURVai0
         iuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=94r73LrRNpO7YYFshzYM25uztFOXVTrm/QHuYFLiQ7w=;
        b=425BnfRAzodv8eZjGrkUjgbNda2UfFHq+D2gqTCDcQKRFjFdDLd6qXJBwdiJXqqfOK
         U4u6tSlFEicAJNwFjUu76S2Nq5UqyfZH6M0m5jcijoQZioqekJDE6Be/5TNgf8k3Asz9
         245pNTgPgseUBbMDyQBQ2URO9jTsrZOjN0/J+dbRbkYjZFvj1NjC8jym4XmhrpPFEefl
         y3tiKTKzXvawO+/LFJnBBxcz2OWeePSkUWYMpwtgcvHVpJCBIR2Pmx+rpWbAZNFirb3+
         NZYvU8wyVSw5hh1KAn063BIQspl1IYgNFlzSjUYWotGE0Ww1qn7leC6MS/OYnzo5SwZ1
         YBYA==
X-Gm-Message-State: AOAM532iZAPBZvMObUE/wTs4kriKb5MtEepLoXMPI2ldTWyGFH7E5jaz
        etFS44QL7Fw82BHAoPOq/yZoTPVfvCZ8FMB8uVw=
X-Google-Smtp-Source: ABdhPJzY3uRVFinJaUL83lROLKmjYUZ+TZRkDI5fVeFEVDRnDD4++VfHZ1wYicaoN9REPkmsXvaggGijHkcU6zzfCJU=
X-Received: by 2002:a05:6122:c9f:b0:330:e2ed:4786 with SMTP id
 ba31-20020a0561220c9f00b00330e2ed4786mr7735605vkb.29.1645449726641; Mon, 21
 Feb 2022 05:22:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d8cd:0:b0:28c:6bb4:8918 with HTTP; Mon, 21 Feb 2022
 05:22:06 -0800 (PST)
From:   Anders Pedersen <ousmanebarkissou@gmail.com>
Date:   Mon, 21 Feb 2022 13:22:06 +0000
Message-ID: <CAE0fZ3d1A2trQ_6K_TKOtuh1imki0Bk2BNv+2OWiPjRVVrO41A@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Greeting, I'm Anders Pedersen, from Norway. I want to know if this
email is valid? Thanks.
