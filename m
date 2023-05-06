Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CB06F927E
	for <lists+linux-fbdev@lfdr.de>; Sat,  6 May 2023 16:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbjEFOSj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 6 May 2023 10:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjEFOSi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 6 May 2023 10:18:38 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3989E19D45
        for <linux-fbdev@vger.kernel.org>; Sat,  6 May 2023 07:18:22 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-546615d6f47so1768387eaf.0
        for <linux-fbdev@vger.kernel.org>; Sat, 06 May 2023 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683382701; x=1685974701;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opeeHjTpE8hf7IkSOrjrz4V6UTxg/7z0lzjIXtvA3kY=;
        b=GdYDvuVYqNFaenrkruzqeGP0rESUb4u7wAFAALHWHjOsQrvJM6HLf+eLwe79Xvfmya
         27x+2sAxsQcEptC1q96MRwxEDeGzG/l8jeu66blhpm8Maz8Oi0vNDFWdPAfWK4qrlzEg
         +Nt1u2UpUlEb1Gy57aOCV3wETTHZY0C+s+UT9dFQhDrR62PgRGEc2u3W/bbFOZdnKESv
         GvltIDzX4TAPo5VwpNtCrK73t6SJV+nYKJB3eGu0mEaonPhnbuhj+TYNpH53WI0snxAs
         8WeEQERdsmKZVndXBIEKT26e8DBo0mc4LT7QPbkOktDWjTy8YeP20SeiKBELFmzaNuj6
         Tf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683382701; x=1685974701;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opeeHjTpE8hf7IkSOrjrz4V6UTxg/7z0lzjIXtvA3kY=;
        b=U6kWF9YOtTjbdU/+d9bI79V8Gs9hXqo4KvUL5d1C/WzOicz6H3Y04fZPX6SYsbdVZx
         D+f4PIt+hSlbSFAJpWdzzoUPEKjCf987TVPBMohfNNanywYGkaGFYeiHPO/GSXjgfziE
         wTUswzPbL6k67zNFjO7qjJjO0f/lkC2YMx/kzzyooi2e0qJP9C1pJFVhY1V6lIpxoz+U
         6cKaFuhSF34+W5ohtTodP8bG3dZxYoq6gUAQhatGPXQVUr4ZfbzshSU1CayOyc/SX6rP
         hlWUJQ69F/KYGM60TycGzwlNvpBgfJ4rdeCYLTitdn6YQtCE2pTQhl6zdxUDCe4zKhpM
         xUKw==
X-Gm-Message-State: AC+VfDxP+yfIcrNVwRvF3m3cAkvz/zZpfv/4lHrf6UdqZ99vnd72246H
        DuA2SWPlLrp4h8vOoLS9YgTPKuHGLTPTuqPBfw==
X-Google-Smtp-Source: ACHHUZ4iVN20xoq1soIc+6sTNrutwJBRdmrvk7S2njjJRHg383gp9i0FvEER4xsO8gQ+c+LcaGs7YxrHTZrEDvDfafI=
X-Received: by 2002:a4a:d21e:0:b0:54f:53f5:b1ea with SMTP id
 c30-20020a4ad21e000000b0054f53f5b1eamr277487oos.8.1683382701489; Sat, 06 May
 2023 07:18:21 -0700 (PDT)
MIME-Version: 1.0
Sender: minkaylinmanth73@gmail.com
Received: by 2002:a05:6358:920d:b0:114:bf62:50e0 with HTTP; Sat, 6 May 2023
 07:18:21 -0700 (PDT)
From:   Kayla Manthey <sgtkylamanthey73@gmail.com>
Date:   Sat, 6 May 2023 14:18:21 +0000
X-Google-Sender-Auth: rGq9ZvSM9oTiys3StkDsYRVTD8g
Message-ID: <CAC7nsSNTdQiEUQEL55+BBaGd4iYrVwH-pHNMzbEhQWZ0QCPP6A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello, please  did  you  receive  my  previous  email?, thank you.
