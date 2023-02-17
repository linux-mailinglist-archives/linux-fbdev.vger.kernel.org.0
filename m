Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D3169B51C
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Feb 2023 22:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjBQVv1 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Feb 2023 16:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBQVv0 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Feb 2023 16:51:26 -0500
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C7B4AFF1
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Feb 2023 13:51:24 -0800 (PST)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-535a11239faso44714917b3.13
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Feb 2023 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gV7232FeLNy4yd+DHC1nJA77lI8+9CkkdqtUh8CTXGY=;
        b=oiG4jIqAYwj1biMQGsII4JsqJEiCN9EJ2ifvgw1p2bQmNF+66YrcgErGGCDU43TdTf
         TRHMxAEGbjfiBx30ILBncZrwP6LT51kQhVaBmymQ5KmyatYrhBoO1vmmdRbARtSvSC1d
         Lm1ULntHyc43kinoFYHxGqhnJSGKKFueSOa37lYUtFdLXN3L3oGxWZvJs7LDgLlmYbrx
         x5i840aXP1FFlVEiIBOZdTkvj7dIEPc66Ky1ojS1Q39wn6Fn0UDIiQJTQWPBPo1uFmhD
         9bgB8F/FVg17ff63/nQP2GJGl+GjTjNXGNGc4dOS3uD7FGtKar/W0/XFM8ANFtHEoy+2
         Bvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gV7232FeLNy4yd+DHC1nJA77lI8+9CkkdqtUh8CTXGY=;
        b=CvKmkQvMkH8RzMcC/rsoK8yn04vlP0ZrPiVeOreYSVh88fjAnw6pAgxA6VvrywPCfu
         rugG6Jj36mJ6I2HhF8TXtlI6A1iVdU0AdYuE3kD+/P2K2aS4Gc9gE3ycxwmuomIXchsO
         4OOaBiCkglMTi0F2BZgh1lFVPgASwU+UE3LeZQvXwupecQQhzIf63XXpgwAlhN2MLFus
         TqAbCSy2drYS6Nq0ZRI/rmYDFhZcGWuK1Tft3PYwWGAeYFbTkiKKZGUjUF3VSJWJx81C
         J9JQLSfLcvnrubT6JVHAnRAxTliNx+tldI70TMKkoy+L9+vf3gAqrRugqf3pXk6HForR
         RJTw==
X-Gm-Message-State: AO0yUKWa9Ax9joVVyGgA8zDZIOFATLU4LYYTnyuVdOsU5/8X/QZUS9Ja
        uUu71+N3GzmsY9MR0PHVy3o6Jtb/QUcFrPlA3rM=
X-Google-Smtp-Source: AK7set8OiaiqPU6hIMRjHy5ft+4EbtHxNxKzUzUc4inCyFKbyQ4S0fZINim5a5CilWRdG5BosDHVDdD24ogcIV9nK7Q=
X-Received: by 2002:a81:ad22:0:b0:533:9ffb:cb12 with SMTP id
 l34-20020a81ad22000000b005339ffbcb12mr4939ywh.10.1676670683221; Fri, 17 Feb
 2023 13:51:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:290d:b0:12f:b462:d22a with HTTP; Fri, 17 Feb 2023
 13:51:22 -0800 (PST)
Reply-To: chesterreaaa@gmail.com
From:   "Chester R. Ellis" <officemuub@gmail.com>
Date:   Fri, 17 Feb 2023 22:51:22 +0100
Message-ID: <CALioM71gYmYoXA4w=PNyhpTet=H4a1-QfRgm7UsE1xrcOiiS7Q@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Greetings

I have sent you mails, but still have not received a response. Kindly
get back to me for a mutual benefit transaction.

Thank you.
Chester R. Ellis
